# Slides and speaker script

Slides (28): https://claude.ai/artifact/Q24UHzR9u456CfzbKW84UX
Private link: only the owner can open it until it is shared from the page's **Share** menu. Open it in presenter mode (play button) and keep this file on a second screen.

This script follows the slides one by one, in deck order. Spoken lines are in quotes. `Chat` = ask the Zoom chat. The terminal part is in [`../DEMO.md`](../DEMO.md) (minute by minute, exact commands).

Timing is indicative: hook ~3 min · theory ~22 min · commands ~5 min · demo ~22 min · close ~5 min.

---

## Block 1. Hook (~3 min)

### 1. Cover (Docker + whale)
- "Hola a todos. Hoy hablamos de Docker: contenedores, imágenes y volúmenes. Y al final vais a poder hacerlo en vuestra máquina."
- "La idea: una analogía de restaurante para entenderlo, y luego dockerizamos un proyecto real, el Taxímetro."

### 2. "En mi máquina funciona"
- Señala las dos tarjetas: *Mi portátil: funciona* / *Portátil de un compañero: falla*.
- "Mi código va bien. Se lo paso a un compañero y le falla: otra versión de Python, de Node..."
- **Chat:** "¿A quién le ha pasado?" (calentamiento, 20 s).
- Frase clave (sale en la diapositiva): "El problema no es el código: es el entorno."

### 3. "Misma receta, mismo plato, en cualquier cocina"
- Señala los 3 ordenadores con el mismo contenedor naranja.
- "Docker empaqueta la app con todo lo que necesita. Funciona igual en tu portátil, en el de tu compañero y en el servidor."

---

## Block 2. Theory (~22 min)

### 4. ¿Qué es Docker?
- "Docker ejecuta aplicaciones en contenedores: cajas aisladas y ligeras."
- Los 3 puntos: lleva la app + librerías + configuración · comparte el kernel del sistema anfitrión · arranca en segundos y pesa megas.
- Señala el contenedor de carga: "como los contenedores de los barcos, da igual lo que lleven dentro, se mueven igual."

### 5. ¿Por qué se usa?
- Tres tarjetas, una frase cada una:
  - **Mismo entorno:** tu máquina, la del compañero, el servidor.
  - **Rápido y ligero:** segundos y megas, no gigas.
  - **Aislamiento:** cada app con sus dependencias, sin pelearse.
- Si preguntan por seguridad: "ayuda, pero un contenedor no es una caja fuerte."

### 6. Contenedor vs máquina virtual
- **Chat (predicción):** "¿Un contenedor lleva su propio sistema operativo completo? Sí / No." Espera 20-30 s.
- Izquierda (VM): hardware, SO anfitrión, hypervisor y **un SO completo por app**. Derecha (contenedor): Docker y las apps directas, sin SO extra.
- Respuesta: "No. Comparte el kernel del anfitrión. Por eso: gigas y minutos contra megas y segundos."
- Si vas justa de tiempo: déjalo en una frase.

### 7. Docker en un restaurante (el mapa)
- "Esta tabla es el mapa de toda la teoría. Si alguien se pierde, volvemos aquí."
- Léela en voz alta rápido: Dockerfile = receta escrita · Imagen = receta con ingredientes preparados · Capas = pasos de la receta · Docker Hub = libro de recetas · Contenedor = el plato · Docker Engine = cocina y chef · Puerto = ventanilla · Volumen = despensa · Multi-stage = cocina de preparación vs plato servido.
- "Ahora vamos concepto por concepto."

### 8. La imagen: la receta lista
- "Una imagen es un paquete de **solo lectura** con todo lo necesario: sistema base, librerías y tu código."
- Señala el candado: "no cambia nunca; si quieres cambiar algo, construyes otra."
- Se descarga de Docker Hub o se construye tú. Ejemplo de nombre: `python:3.13-slim`.
- Vocabulario en inglés: **image**.

### 9. Capas y caché
- Señala las 5 capas (de abajo arriba): `FROM python` → `COPY requirements` → `RUN pip install` → `COPY back/` (tu código) → `CMD`.
- "Cada instrucción del Dockerfile crea una capa. Las 3 de abajo están en caché."
- "Cambio una línea de mi código: solo se rehacen las naranjas. Por eso el segundo build va en segundos."
- Regla: "lo que menos cambia, arriba del Dockerfile; tu código, al final."
- Se verá en vivo con el segundo `docker build`.

### 10. Una imagen, muchos contenedores
- "De una misma receta salen muchos platos."
- Señala la capa naranja de cada contenedor: "cada uno tiene su propia capa de escritura."
- Gancho (importante): "y esa capa se pierde cuando borras el contenedor." (Esto prepara los volúmenes.)

### 11. El contenedor: el plato servido
- "Un contenedor es una imagen **en marcha**, con una capa de escritura encima." Se crea con `docker run`.
- **Chat (predicción):** "Si borro el contenedor, ¿sigue mi cuenta registrada? Sí / No." No lo resuelvas: "lo comprobamos en vivo".
- Vocabulario: **container**.

### 12. Ciclo de vida
- Cuatro cajas: **creado → en marcha → detenido → eliminado**, con `start`, `stop`, `rm`.
- "`docker run` = create + start en un solo paso."
- "Stop conserva lo escrito; `rm` lo destruye."
- `docker ps` muestra los que corren, `docker ps -a` todos. Esto sale en el fallo controlado de la demo (un contenedor que queda en *Created*).

### 13. Puertos: la ventanilla
- "El contenedor está aislado. Sin `-p`, nadie de fuera llega a él."
- Señala: navegador → `localhost:8080` → Docker redirige → `8000` dentro del contenedor.
- ⚠️ La diapositiva dice **8080:8000** como ejemplo. En la demo usaremos **8000:8000**: dilo ("en la demo será 8000 a 8000, pero lo importante es el formato").
- Formato: **puerto_de_tu_máquina:puerto_del_contenedor**. "El de la izquierda tiene que estar libre." (Plantas el fallo controlado.)

### 14. El Dockerfile: la receta escrita
- "El Dockerfile no es un lenguaje de programación: es una **lista de instrucciones**, una por línea, que Docker lee de arriba abajo."
- Recorre la columna derecha: `FROM` imagen base · `WORKDIR` carpeta de trabajo · `COPY` pasa archivos · `RUN` se ejecuta al **construir** · `ENV` variable · `EXPOSE` documenta el puerto · `CMD` se ejecuta al **arrancar**.
- Aclara: es un ejemplo simplificado; el real lo escribes en la demo.
- Una frase para el compañero: "Para varios contenedores a la vez existe `docker-compose.yml`, en YAML. De eso se encarga [compañero] la semana que viene."

### 15. Multi-stage: cocina y plato final
- "Etapa 1: un contenedor con Node que **compila el front**. Produce la carpeta `dist`."
- "Etapa 2: Python + el back. Solo copio `dist`."
- Señala la X: "Node se queda en la etapa 1; no viaja a la imagen final."
- "No sirves las cacerolas, solo el plato terminado." Resultado: **una imagen pequeña y un solo contenedor**, porque el back ya sirve el front.
- Si vas justa de tiempo: se explica directo en la demo y esta diapositiva se salta.

### 16. El problema: los datos se pierden
- Cambio de sección: ahora volúmenes.
- "Contenedor con cuenta, tarifas e historial → `docker rm` → contenedor nuevo, **vacío**."
- "En el Taxímetro tendrías que registrar la empresa otra vez y perderías el historial."
- Enlaza con tu pregunta de la diapositiva 11.

### 17. Tres formas de guardar datos
- Tres columnas:
  - **Volumen con nombre** (`-v datos:/data`): lo gestiona Docker. Para datos que deben sobrevivir.
  - **Bind mount** (`-v ./src:/app`): una carpeta de tu máquina. Para desarrollo.
  - **tmpfs** (`--tmpfs /tmp`): memoria RAM, se borra al parar.
- Pie de la diapositiva: producción → volumen · desarrollo → bind mount · temporal → tmpfs.
- Restaurante: volumen = la despensa del local; bind mount = ingredientes que traes de casa; tmpfs = la pizarra del día.
- "Hoy usamos el volumen con nombre."

### 18. El volumen sobrevive al contenedor
- "El contenedor viejo se borra (cruz roja). El nuevo se conecta al mismo volumen y los datos siguen."
- "Se tira el plato, la despensa sigue llena."
- Si vas justa: una frase y adelante.
- Transición: "Ahora, un momento en inglés sobre esto mismo."

---

## English moment (~3 min)

### 19. English moment · Volumes
Lee despacio; el subtítulo en español está para quien se pierda. Una frase por tarjeta:
- "A container is **temporary**." *(Un contenedor es temporal.)*
- "When you delete it, its data is **gone**." *(Cuando lo borras, sus datos desaparecen.)*
- "A **volume** lives outside the container." *(Un volumen vive fuera del contenedor.)*
- Pie: "Say it with me: temporary, gone, volume." Que repitan.

### 20. English moment · Why it matters
- "Databases, accounts, uploads: keep them in a volume." *(Bases de datos, cuentas, archivos: guárdalos en un volumen.)*
- "You can **replace** the container and keep the data." *(Puedes reemplazar el contenedor y conservar los datos.)*
- "Update the image, run a new container, **same data**." *(Actualiza la imagen, lanza un contenedor nuevo, los mismos datos.)*
- **Chat question (in English if they can):** "What do we put in the volume in our Taxímetro demo?"
- Respuesta: cuenta, tarifas, historial y log (todo lo que está en `/data`).
- Cierre en inglés: "Think of it like a restaurant: the dish can be thrown away, but the pantry keeps the ingredients. Let's see it in action."

---

## Block 3. Commands (~5 min)

Dilos en voz alta en inglés; la explicación en español.

### 21. Comandos: imágenes
- `docker build -t taximetro .` (`-t` = nombre/tag; el punto = carpeta del Dockerfile) · `docker images` · `docker pull python:3.13` · `docker rmi taximetro` · `docker history taximetro` (muestra las capas).

### 22. Comandos: contenedores
- `docker run -d -p 8000:8000 --name taxi taximetro` (`-d` = segundo plano, `--name` evita nombres aleatorios).
- `docker ps` / `docker ps -a` · `docker logs taxi` · `docker stop` / `docker start` · `docker rm` · `docker exec -it taxi sh`.
- Enlaza con la diapositiva 12 (ciclo de vida).

### 23. Comandos: volúmenes y limpieza
- `docker volume create datos` · `docker volume ls` · `docker volume inspect datos` · `docker run -v datos:/data ...` · `docker volume rm datos` · `docker system prune`.
- ⚠️ Avisa: `volume rm` y `prune` **pueden borrar datos**.
- Formato de `-v`: `nombre_del_volumen:ruta_dentro_del_contenedor`.

---

## Block 4. Live demo (~22 min)

### 24. Demo en vivo
- Dockerfile → imagen → contenedor → volumen.
- "Vamos a dockerizar el Taxímetro paso a paso. Podéis seguirlo: rama `main` del repo, sin Docker."
- ⚠️ **Antes**: haz el repo público (ahora es privado) o pasa el enlace de otra forma. Pregunta quién tiene Docker abierto (`docker --version`); quien no pueda, mira.
- Pasas a compartir pantalla con terminal + navegador (ventana privada).

### 25. Los pasos de la demo (hoja de ruta, 10 s)
Léela y cambia a la terminal. A partir de aquí sigue [`../DEMO.md`](../DEMO.md):
1. `.dockerignore` y Dockerfile en dos etapas
2. `docker build` y ver capas (y caché al repetir)
3. `docker run -p` y registrar la empresa
4. Fallo controlado: *port is already allocated*
5. Borrar el contenedor: **la cuenta desaparece**
6. Repetir con un **volumen**: borrar y la cuenta sigue ahí

Mismo orden que `DEMO.md`. Pausa en cada paso: "¿alguien necesita que repita?"

---

## Block 5. Close (~5 min)

### 26. Lo que nos llevamos
- Tres tarjetas: **Imagen** (receta lista, solo lectura, por capas) · **Contenedor** (plato servido, temporal, aislado, desechable) · **Volumen** (despensa, los datos sobreviven).
- Frase final: "Si recuerdas una sola cosa: el contenedor se borra, el volumen se queda."
- Teaser: "La semana que viene [compañero]: Docker Compose y microservicios, varios contenedores juntos."
- En inglés si quieres: "We wrote a Dockerfile. We built an image and ran a container. We added a volume, and the data survived."

### 27. Kahoot
- Antes de la sesión: crea el Kahoot (ideas en `DEMO.md`, sección Kahoot) y **escribe el PIN en la diapositiva** (ahora pone `______`).
- "Entrad en kahoot.it con el PIN." ~5 min.

### 28. Repo y recursos
- `main` = Taxímetro sin Docker (para seguir la demo) · `solution` = Dockerfile, `.dockerignore` y `CHEATSHEET.md` hechos.
- `github.com/Charlottedoulcet/docker-pildora` (hazlo público antes).
- "¿Preguntas? Thank you!"

---

## Checklist rápida antes de empezar
- [ ] Repo público (`gh repo edit --visibility public --accept-visibility-change-consequences`)
- [ ] PIN del Kahoot puesto en la diapositiva 27
- [ ] Dockerfile probado una vez entero (el daemon estaba apagado cuando se escribió) y aviso "SIN PROBAR" quitado de `DEMO.md`
- [ ] Puerto 8000 libre, Docker Desktop abierto, ventana privada en el navegador
- [ ] Presentación abierta en modo Present; este archivo y `DEMO.md` en otra pantalla
- [ ] `git checkout main` en la carpeta que enseñas (para que se vea sin Docker)
