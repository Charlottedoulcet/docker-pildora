# Guion de la demo (~22 min, orientativo)

> ⚠️ **SIN PROBAR.** Escrito leyendo el código del Taxímetro, pero el daemon de Docker estaba apagado y no se ha hecho ni un `docker build`. Ensayar entero una vez antes de la sesión (ver "Antes de la sesión").
> Este archivo irá en la rama `solution` del repo como chuleta.

Meta: dockerizar el Taxímetro con **una imagen, un contenedor y un volumen**, y ver con tus ojos que sin volumen los datos se pierden.
Hilo: restaurante. Receta (Dockerfile) → imagen → plato (contenedor) → despensa (volumen).

## Datos del proyecto que mandan en el Dockerfile
- El back arranca con `uvicorn taximetro.api:app` y escucha en el **8000**.
- El back sirve el front ya compilado desde `<raíz>/front/dist` (`back/taximetro/api/factory.py:30`) → **un solo contenedor**. Node solo hace falta para compilar.
- Rutas **relativas al directorio de trabajo**: `config.ini`, `auth.ini`, `taximetro.db`, `taximetro.log` (`back/taximetro/settings.py`). → `WORKDIR /data` y **un solo volumen** sobre `/data` guarda cuenta, tarifas, historial y log.
- El código se importa como `taximetro`, y el workdir será `/data`, así que hace falta `PYTHONPATH=/app/back`.
- `auth.ini`, `taximetro.db` y `taximetro.log` están en `.gitignore` pero **existen en tu máquina**: sin `.dockerignore` se colarían en la imagen. Esa es una buena explicación en directo del `.dockerignore`.

---

## Antes de la sesión (checklist)
1. Parar el servidor local del Taxímetro (`uvicorn`/`npm run dev`): el **puerto 8000 debe estar libre**.
2. Abrir Docker Desktop y esperar a que diga "running".
3. `docker pull python:3.13-slim` y `docker pull node:20-slim`.
4. Ensayo completo en una carpeta limpia (la rama `main` sin Docker) y comprobar que el Dockerfile de abajo funciona. Si algo falla, arreglarlo en `solution`.
5. Dejar el estado limpio: `docker rm -f taxi taxi2 taxi3` y `docker volume rm taxi-data`. **No borres la caché de build**: es lo que hace rápido el `build` en directo.
6. Abrir el navegador en **ventana privada** (si no, un token viejo en el navegador puede confundir la demo).
7. Dos terminales preparadas, letra grande. Zoom: compartir pantalla con terminal + navegador visibles.
8. Tener `DEMO.md` abierto en otra pantalla (no la compartida).

---

## Minuto a minuto

### 0:00-2:00 · El punto de partida
**Qué haces:** `ls` en la rama `main`: se ve `back/` y `front/`, y ningún archivo de Docker.
**Qué dices:** "Hoy esto solo funciona si tienes Python 3.13 y Node 20. Vamos a meterlo en un contenedor para que funcione en cualquier máquina."
💬 **Predicción 1:** "¿Cuántos archivos de Docker hay ahora? 0. Al final de la sesión, ¿cuántos creéis que necesitamos? 2 / 3 / 5." (Respuesta: 2, `.dockerignore` y `Dockerfile`.)

### 2:00-4:00 · `.dockerignore` (lo escribes en directo)
```
.git
**/__pycache__
**/*.pyc
back/.venv
back/taximetro.db
back/auth.ini
back/taximetro.log
back/rides_history.csv
front/node_modules
front/dist
docs
```
**Qué dices (en inglés, una frase):** "This file tells Docker what NOT to copy into the image."
**Por qué:** sin esto copiarías tu base de datos local, tu contraseña (`auth.ini`) y `node_modules` (cientos de MB) dentro de la imagen. Eso es un fallo real de seguridad.
Restaurante: lo que se queda fuera del menú.

### 4:00-10:00 · El Dockerfile (en directo, en dos tandas)
Primero explica la idea del multi-stage con el esquema D15 y luego escribe.

**Tanda 1: la etapa que compila el front (la cocina de preparación)**
```dockerfile
FROM node:20-slim AS front
WORKDIR /front
COPY front/package*.json ./
RUN npm ci
COPY front/ .
RUN npm run build
```
Qué decir: `FROM` = imagen base (el libro de recetas), `AS front` = le pongo nombre a esta etapa, copio primero `package*.json` y luego el resto. **Esto es lo de las capas y la caché** (esquema D9): si no cambian las dependencias, `npm ci` no se repite.

**Tanda 2: la imagen final (el plato servido)**
```dockerfile
FROM python:3.13-slim
WORKDIR /app
COPY back/requirements.txt back/requirements.txt
RUN pip install --no-cache-dir -r back/requirements.txt
COPY back/ back/
COPY --from=front /front/dist front/dist

WORKDIR /data
COPY back/config.ini .
ENV PYTHONPATH=/app/back
EXPOSE 8000
CMD ["uvicorn", "taximetro.api:app", "--host", "0.0.0.0", "--port", "8000"]
```
Qué decir:
- `COPY --from=front` = "me llevo solo el resultado (`dist`), no Node ni las cacerolas".
- `WORKDIR /data` = "aquí vivirán los datos de la app". Plantar la semilla: *"recordad `/data`, lo vamos a necesitar."*
- `--host 0.0.0.0` = que escuche desde fuera del contenedor (si no, no se puede entrar).
- `EXPOSE` es documentación; lo que realmente publica el puerto es `-p`.
- `CMD` se ejecuta al **arrancar**, `RUN` al **construir**.

### 10:00-12:00 · Build
```bash
docker build -t taximetro .
```
Mientras corre, señala las capas y los pasos en la salida (`CACHED` si ya las construiste en el ensayo).
```bash
docker images                 # enseñar el nombre y el tamaño
```
**Momento wow:** "esta imagen no lleva Node". Opcional: `docker run --rm taximetro node -v` → falla porque Node no existe (y eso es lo que queremos).
💬 **Predicción 2:** "Cambio una línea del código Python y reconstruyo. ¿Tarda minutos o segundos?" → toca un archivo en `back/`, repite `docker build` y se ve que las capas de dependencias salen `CACHED`.

### 12:00-14:00 · Run y primer viaje
```bash
docker run -d --name taxi -p 8000:8000 taximetro
docker ps
docker logs taxi
```
- Navegador (ventana privada): http://localhost:8000
- **Registra una empresa y contraseña** (primera visita), inicia un viaje, pasa a *moving*, espera ~10 s y termina el viaje. Mira el **historial**.
- Qué decir: "Esto no es el servidor de mi máquina: es el contenedor." Señala `-p 8000:8000` (la ventanilla) y `--name` y `-d` (en segundo plano).
- `docker exec -it taxi ls /data` → se ven `config.ini`, `auth.ini`, `taximetro.db`, `taximetro.log` **dentro del contenedor**. Aquí es donde viven los datos. Salir con `exit` si abres `sh`.

### 14:00-16:00 · Fallo controlado 💥
💬 **Predicción 3 (antes de ejecutar):** "Lanzo otro contenedor igual en el mismo puerto. ¿Qué pasa? (a) funciona (b) error."
En la 2.ª terminal:
```bash
docker run -d --name taxi2 -p 8000:8000 taximetro
```
Sale algo como `Bind for 0.0.0.0:8000 failed: port is already allocated`.
Deja que el chat adivine la causa y el arreglo; luego:
```bash
docker ps -a          # ¡taxi2 aparece como "Created"! (ciclo de vida, esquema D12)
docker rm taxi2       # el contenedor falló al arrancar pero existe; hay que borrarlo
docker run -d --name taxi3 -p 8001:8000 taximetro
docker ps             # dos contenedores, misma imagen (esquema D10)
```
- Abre http://localhost:8001: **otra app vacía** (pide registrar de nuevo). Cada contenedor tiene sus propios datos. Conecta con D10 y con el aislamiento.
- Limpiar: `docker rm -f taxi3`.

### 16:00-18:00 · Borro el contenedor: los datos se pierden 💀
💬 **Predicción 4 (la de D11):** "Borro el contenedor y creo uno nuevo desde la misma imagen. ¿El viaje que hice sigue en el historial? Sí / No."
```bash
docker rm -f taxi
docker run -d --name taxi -p 8000:8000 taximetro
```
- Recarga el navegador: **te pide registrar la empresa otra vez** y el historial está vacío. Se perdió **todo**: cuenta, tarifas, viajes.
- Qué dices: "El contenedor es el plato: lo tiré y se fue con todo lo que tenía dentro. Necesitamos la despensa."

### 18:00-22:00 · El volumen 💚 (el clímax)
```bash
docker rm -f taxi
docker volume create taxi-data
docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro
docker volume ls
```
- Navegador: registra empresa, haz un viaje, mira el historial.
💬 **Predicción 5:** "Ahora sí borro el contenedor. ¿Sobrevive?"
```bash
docker rm -f taxi
docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro
```
- Navegador: **piden login (no registro)**, entras con tu contraseña y el **historial sigue ahí**. 🎉
- Explica en una frase: "mismo `-v taxi-data:/data` → mismo almacén". Es una **named volume** (esquema D17).
- Extra opcional si sobra tiempo: `docker volume inspect taxi-data` (se ve dónde lo guarda Docker).
- Aviso honesto (1 frase): si ejecutas `docker volume rm taxi-data`, ahí sí se pierde todo. El volumen sobrevive al contenedor, no a que lo borres.

### Cierre de la demo (~1 min)
Resumen de lo que habéis hecho, en tres frases (puedes decirlas en inglés):
- "We wrote a Dockerfile." (receta)
- "We built an image and ran a container." (plato)
- "We added a volume, and the data survived." (despensa)

Limpieza opcional: `docker rm -f taxi` · `docker volume rm taxi-data`.
Teaser: "La semana que viene [compañero] os enseña a levantar **varios contenedores a la vez** con Docker Compose."

---

## Plan B (si algo falla en directo)
| Problema | Qué haces |
|---|---|
| `build` falla o es lentísimo | `git checkout solution` y sigues con el Dockerfile ya hecho; explica que "es el mismo archivo que habríamos acabado de escribir" |
| Error al arrancar de `uvicorn` / módulo no encontrado | Mira `docker logs taxi`. Casi seguro es `PYTHONPATH` o el `WORKDIR`; compara con `solution` |
| Pantalla en blanco en el navegador | `front/dist` no llegó a la imagen: revisa el `COPY --from=front` y que el front tenga `npm run build` OK |
| El puerto 8000 está ocupado de verdad (sin querer) | `docker ps` para ver quién lo usa; o publica en otro: `-p 8001:8000` |
| Te pasas de tiempo | Recorta: sáltate la predicción 2 (caché), el `docker exec`, y el 2.º contenedor del fallo controlado (deja solo el error del puerto) |

## Ideas de preguntas para el Kahoot (cierre, ~5 min)
1. ¿Qué es una imagen? (plantilla de solo lectura / un contenedor en ejecución / una VM) → plantilla.
2. ¿Qué pasa con los datos al borrar un contenedor sin volumen? → se pierden.
3. ¿Qué instrucción del Dockerfile elige la imagen base? → `FROM`.
4. `-p 8000:8000`, ¿qué hace? → publica el puerto.
5. ¿Qué comando lista los contenedores en marcha? → `docker ps`.
6. ¿Cuántos contenedores puedes crear desde una imagen? → todos los que quieras.
7. ¿Qué tipo de montaje es mejor para una base de datos? → named volume.
8. ¿Qué lleva un contenedor que no lleva una máquina virtual? → NADA extra: no lleva SO completo (comparte kernel).
