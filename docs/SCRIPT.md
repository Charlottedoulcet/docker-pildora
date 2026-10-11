# Guion hablado completo (diapositiva por diapositiva)

Diapositivas (28): https://claude.ai/artifact/Q24UHzR9u456CfzbKW84UX
Enlace privado: solo lo abre quien lo comparta desde **Share**. Ábrelo en modo presentación y deja este archivo en otra pantalla (no la compartida).
Terminal de la demo: [`../DEMO.md`](../DEMO.md) (comandos exactos). Este guion incluye también **lo que dices en cada paso de la demo** (sección final).

**Cómo leerlo**
- El texto normal entre comillas es **lo que dices**, tal cual. Está escrito para hablar: frases cortas, con pausas.
- *Cursiva* = lo que haces (señalar, esperar, preguntar al chat).
- No hace falta memorizarlo: cuando lo hayas leído dos veces, cuéntalo con tus palabras. Lo importante son las ideas y las analogías.
- Tiempos orientativos: gancho ~3 min · teoría ~22 min · comandos ~5 min · demo ~22 min · cierre ~5 min.

---

# BLOQUE 1. Gancho (~3 min)

## 1. Portada: Docker (ballena con contenedores)
*(~30 s)*

"Hola a todos. Hoy os hablo de Docker, y en concreto de tres cosas: contenedores, imágenes y volúmenes.

Voy a hacerlo de una forma un poco distinta. Primero os explico todo con una analogía de un restaurante, para que no se quede en palabras raras. Y después lo hacemos de verdad: vamos a coger el proyecto del Taxímetro y lo vamos a meter dentro de Docker, paso a paso. Si tenéis Docker instalado, podéis hacerlo conmigo desde vuestra máquina.

Y una cosa: a mitad de la presentación habrá un momento en inglés, y al final un Kahoot. Así que atentos."

*(Señala la ballena con los contenedores.)* "La ballena es el logo de Docker, y lo que lleva encima son contenedores. Ya veréis por qué."

## 2. "En mi máquina funciona"
*(~1 min)*

*(Señala las dos tarjetas.)*

"Empiezo con una frase que todos hemos dicho o hemos oído: **'en mi máquina funciona'**.

Mirad el dibujo. A la izquierda, mi portátil: la aplicación funciona perfecto. A la derecha, el portátil de un compañero. Le paso exactamente el mismo código y... le falla.

¿Por qué? Porque él tiene otra versión de Python, o de Node, o le falta una librería, o el sistema operativo es distinto. El código es el mismo, pero **lo que hay alrededor del código** no lo es."

*(Pregunta al chat.)* "Os pregunto: ¿a quién le ha pasado? Escribid un sí en el chat." *(Espera 15-20 segundos, lee en voz alta dos o tres.)*

"Ya veo que no soy la única. La frase que quiero que os llevéis de esta diapositiva es la de abajo: **el problema no es el código, es el entorno.** Y 'entorno' quiere decir todo lo que rodea al código: el sistema operativo, las versiones, las librerías, la configuración."

## 3. "Misma receta, mismo plato, en cualquier cocina"
*(~1 min)*

*(Señala los tres ordenadores.)*

"Docker resuelve justo ese problema. Mirad: aquí tengo tres máquinas distintas. Mi portátil, el de mi compañero y un servidor. Y en las tres corre **exactamente el mismo contenedor**, el cuadrado naranja.

La idea es esta: en lugar de pasar solo el código y cruzar los dedos, **empaqueto la aplicación con todo lo que necesita para funcionar**: la versión de Python, las librerías, la configuración. Todo en una caja cerrada. Y esa caja funciona igual en cualquier sitio.

Lo voy a decir con la analogía que usaremos toda la sesión: **misma receta, mismo plato, en cualquier cocina.** Si la receta está completa, da igual en qué cocina la prepares: el plato sale igual.

Ahora vamos a ver qué es exactamente esa caja."

---

# BLOQUE 2. Teoría (~22 min)

## 4. ¿Qué es Docker?
*(~1,5 min)*

"**Docker es una herramienta para ejecutar aplicaciones dentro de contenedores.** Un contenedor es una caja aislada y ligera.

Mirad lo que pone a la izquierda. Tres ideas:

**Primera: lleva la app, sus librerías y su configuración.** Todo lo que la aplicación necesita para funcionar va dentro. Es lo que hemos dicho: el entorno viaja con la aplicación.

**Segunda: comparte el kernel del sistema anfitrión.** Esta frase suena rara, así que la explico, porque es la clave de todo lo que viene.

Un ordenador tiene dos mundos. Por un lado está el **hardware**: el procesador, la memoria, el disco, la red. Por otro, los programas que usamos: el navegador, Python, vuestro editor de código. Entre medias hay una pieza que hace de intermediaria: el **sistema operativo**. Windows, macOS y Linux son sistemas operativos.

Pues bien, el corazón de un sistema operativo se llama **kernel**, que en español es 'núcleo'. El kernel es la parte que **habla con el hardware**. Cuando un programa quiere leer un archivo, abrir una conexión de red o usar memoria, no lo hace directamente: se lo pide al kernel y el kernel lo hace. Es como el **jefe de sala** de un restaurante: los clientes no entran a la cocina ni abren la nevera, le piden las cosas al jefe de sala y él coordina.

Y 'sistema anfitrión' o 'host' es **tu ordenador**, el que ejecuta Docker. O sea: los contenedores no traen su propio kernel; **usan el de tu máquina**. Por eso son tan ligeros. En un momento lo vemos comparado con las máquinas virtuales.

**Tercera: arranca en segundos y pesa megas.** Consecuencia directa de lo anterior: como no lleva un sistema operativo entero, es pequeño y rápido.

*(Señala el contenedor de carga.)* "Y por eso el dibujo es un contenedor de carga, como los de los barcos. Da igual lo que lleven dentro: todos se transportan igual, en cualquier barco, tren o camión. Lo mismo hace Docker con las aplicaciones."

## 5. ¿Por qué se usa?
*(~1 min)*

*(Señala las tres tarjetas, una a una.)*

"¿Por qué usa Docker todo el mundo? Por tres razones.

**Primera, mismo entorno.** Lo que hemos visto: en tu máquina, en la de tu compañero y en el servidor, la aplicación se comporta igual. Se acabó el 'en mi máquina funciona'.

**Segunda, rápido y ligero.** Arranca en segundos y pesa megas, no gigas. Podéis tener diez contenedores en un portátil normal.

**Tercera, aislamiento.** Cada contenedor vive en su cajita. Imaginad que un proyecto necesita Python 3.9 y otro Python 3.13. Sin Docker, se pelean en vuestra máquina. Con Docker, cada uno tiene la suya dentro de su contenedor y no se enteran el uno del otro."

*(Si alguien pregunta por seguridad:)* "El aislamiento ayuda, pero un contenedor no es una caja fuerte. No lo uséis para ejecutar código en el que no confiáis."

## 6. Contenedor vs máquina virtual
*(~3 min. Es la diapositiva más importante de la teoría: tómate el tiempo.)*

*(Antes de explicar, pregunta al chat.)* "Os hago una pregunta rápida y contestáis en el chat, sí o no: **¿un contenedor lleva dentro su propio sistema operativo completo?**" *(Espera 20-30 segundos. No digas la respuesta todavía.)*

"Vale, ahora lo vemos. Para entenderlo, comparo el contenedor con algo que quizá ya conocéis: una **máquina virtual**.

Una máquina virtual es **un ordenador falso dentro de tu ordenador**. Por ejemplo, tenéis un Mac y queréis probar algo en Windows: abrís VirtualBox o VMware y arranca una ventana con un Windows completo dentro. Ese Windows cree que es un ordenador de verdad.

*(Señala la columna de la izquierda, de abajo arriba.)*

Mirad cómo está construida. Abajo del todo, el **hardware**: tu ordenador real. Encima, tu **sistema operativo**, el anfitrión. Encima, una pieza que se llama **hypervisor**. El hypervisor es el programa que **crea y gestiona las máquinas virtuales**: les reparte trozos de procesador, de memoria y de disco, como un camarero que reparte una tarta entre mesas.

Y encima del hypervisor, cada máquina virtual lleva **un sistema operativo completo**, con su propio kernel, sus propios archivos del sistema, todo. Y dentro de ese sistema operativo, por fin, tu aplicación.

Resultado: si quiero dos aplicaciones aisladas, tengo **dos sistemas operativos completos** corriendo a la vez. Eso son gigas de espacio y minutos para arrancar, porque es como encender dos ordenadores.

*(Señala la columna de la derecha.)*

Ahora el contenedor. Abajo, el mismo hardware. Encima, el mismo sistema operativo anfitrión. Encima, **Docker**. Y encima de Docker, directamente, las aplicaciones. **No hay un sistema operativo por cada app.** Mirad la anotación naranja: ¡sin SO extra por app!

¿Cómo se aíslan entonces? Docker usa funciones que ya trae el kernel de Linux para **engañar a cada aplicación**: le hace creer que está sola en la máquina, con sus propios archivos y sus propios procesos, y además le pone un límite de recursos. Pero por debajo, **todas comparten el mismo kernel**.

Volviendo a la analogía del restaurante: la máquina virtual es como construir **un restaurante entero con su propia cocina para cada plato**. El contenedor es **una sola cocina compartida con varias estaciones de trabajo separadas**. Mucho más barato y rápido de montar."

*(Señala la frase de abajo.)* "Resumen en cifras: máquina virtual, **gigas y minutos**; contenedor, **megas y segundos**."

*(Ahora sí, la respuesta a la pregunta del chat.)* "Y la respuesta a mi pregunta: **no**, un contenedor no lleva su propio sistema operativo completo. Comparte el kernel del anfitrión. Los que habéis dicho que no, bien."

**Matiz honesto (solo si preguntan 'pero yo uso Mac/Windows'):** "Buena pregunta. Los contenedores de Docker necesitan un kernel de Linux. Si tu ordenador es Linux, usan el tuyo. En Mac y Windows, **Docker Desktop lleva dentro una máquina virtual Linux muy pequeña** y los contenedores comparten el kernel de esa mini-máquina. Para vosotros es transparente: no tenéis que hacer nada."

## 7. Docker en un restaurante (el mapa)
*(~2 min)*

"Esta diapositiva es **el mapa de toda la teoría**. No la memoricéis: la dejo aquí para que, si en algún momento alguien se pierde, volvamos a ella. Os la leo en voz alta, rápido, y luego voy concepto por concepto.

*(Señala fila por fila.)*

- **Docker Engine** es **la cocina y el chef**: el programa que hace funcionar todo lo demás.
- **Dockerfile** es **la receta escrita**: un archivo de texto con los pasos, en orden.
- **Imagen** es **la receta con los ingredientes ya preparados**: lista para cocinar, y no se puede modificar.
- **Capas** son **los pasos de la receta**: primero la base, luego la salsa, luego el topping. Se guardan por separado.
- **Docker Hub** es **el libro de recetas**: un sitio público donde hay imágenes ya hechas que puedes descargar.
- **Contenedor** es **el plato que se cocina y se sirve**: una imagen en marcha.
- **Puerto** es **la ventanilla de servicio**: por donde sale el plato hacia el cliente.
- **Volumen** es **la despensa o la nevera**: aunque tires el plato, lo que has guardado ahí sigue.
- **Multi-stage** es **la cocina de preparación frente al plato servido**: no le sirves las cacerolas al cliente, solo el plato terminado.

Ahora vamos uno a uno. Empezamos por la imagen."

## 8. La imagen: la receta lista
*(~1,5 min)*

"**Una imagen es un paquete de solo lectura con todo lo necesario para ejecutar la aplicación.** Dentro lleva: un sistema base (por ejemplo una versión pequeña de Linux), las librerías y tu código.

*(Señala el candado del dibujo.)*

Fijaos en el candado. **Solo lectura** significa que una vez construida, **no cambia nunca**. Si quiero modificar algo, no edito la imagen: **construyo una nueva**. Es como una receta ya impresa: no la tachas, imprimes una versión nueva.

¿De dónde salen las imágenes? De dos sitios. Una, las **descargas** de **Docker Hub**, el libro de recetas público. Por ejemplo, `python:3.13-slim` es una imagen oficial de Python, versión 3.13, en su versión ligera. Eso que va detrás de los dos puntos se llama **etiqueta** o **tag**, y suele indicar la versión. Dos, las **construyes tú** a partir de un archivo con tu receta, el Dockerfile, que veremos enseguida.

Restaurante: la imagen es la receta con los ingredientes ya preparados y medidos, lista para cocinar.

Vocabulario en inglés, que lo vamos a usar toda la sesión: imagen se dice **image**."

## 9. Capas y caché
*(~2,5 min)*

"Ahora una cosa que a mí me parece lo más ingenioso de Docker: **las capas**.

*(Señala la pila de la izquierda, de abajo arriba.)*

Una imagen no es un bloque único: está hecha de **capas apiladas**, como un pastel. Y **cada instrucción del Dockerfile crea una capa**. Mirad: la primera, `FROM python`, es la base. Encima, copio el archivo de requisitos. Encima, instalo las librerías con `pip install`. Encima, copio **mi código**. Y arriba del todo, el comando que arranca la aplicación.

¿Por qué es tan útil? Por la **caché**. Docker guarda cada capa. Cuando vuelvo a construir la imagen, **comprueba capa por capa si algo ha cambiado**. Si no ha cambiado, la reutiliza y no la rehace.

Ejemplo real: cambio una línea de mi código Python. Esa línea afecta a la capa de 'copiar mi código'. Docker rehace **esa capa y las que van encima**, pero las tres de abajo, que no han cambiado, las saca de la caché. Mirad la flecha azul: 'en caché'. La instalación de librerías, que es lo que más tarda, **no se repite**.

Por eso el segundo `docker build` va en segundos, y por eso hay una regla práctica: **lo que menos cambia, arriba en el Dockerfile; tu código, que es lo que más cambia, hacia el final.**

Restaurante: si cambio solo el topping de la pizza, no hace falta volver a amasar la base.

Esto lo vamos a ver en directo: haremos un segundo build y veréis el texto `CACHED` en pantalla."

## 10. Una imagen, muchos contenedores
*(~1,5 min)*

"Otra idea importante. **De una sola imagen puedes crear tantos contenedores como quieras.**

*(Señala el dibujo.)* A la izquierda, una imagen. A la derecha, tres contenedores creados a partir de ella. Es lo que decíamos: **de una misma receta salen muchos platos.** Son idénticos al principio, pero cada plato es independiente.

Y fijaos en lo naranja que hay debajo de cada contenedor: es una **capa de escritura propia**. La imagen es de solo lectura, ¿no? Pues cuando un contenedor necesita escribir algo (guardar un archivo, anotar un dato), lo hace en esa capa fina, **que es solo suya**. El contenedor 1 no ve lo que escribe el contenedor 2.

Y ahora la frase importante, la que quiero que se os quede, mirad lo que pone: 'se pierde con `docker rm`'. **Esa capa de escritura desaparece cuando borras el contenedor.** Guardad esa idea: es el problema que resolveremos con los volúmenes."

## 11. El contenedor: el plato servido
*(~2 min)*

"Entonces, ¿qué es un contenedor? **Un contenedor es una imagen en marcha**, con una capa de escritura encima.

*(Señala el dibujo de abajo arriba.)* Abajo, la imagen, en azul claro, que es de solo lectura. Encima, la capa de escritura, en naranja. Y arriba, la aplicación funcionando. Las tres cosas juntas son el contenedor.

Tres ideas, a la izquierda. Se crea con el comando `docker run`. Puede escribir archivos, pero solo en su capa. Y mirad la advertencia: **si lo borras, lo escrito se pierde.**

Restaurante: el contenedor es **el plato que se está cocinando y sirviendo**. Cuando se acaba y se retira, desaparece. La receta sigue ahí; el plato, no.

Vocabulario: contenedor se dice **container**."

*(Pregunta al chat. Es una apuesta de la demo.)* "Os dejo una pregunta, y contestáis en el chat: **si borro el contenedor, ¿sigue mi cuenta registrada? Sí o no.** No os la resuelvo ahora. Lo comprobamos en vivo, en la demo."

## 12. Ciclo de vida de un contenedor
*(~1,5 min)*

"Un contenedor pasa por estados, como un plato en la cocina. Son cuatro.

*(Señala de izquierda a derecha.)*

**Creado**: el contenedor existe pero todavía no está funcionando. Con `start`, **en marcha**: ya está funcionando, ya sirve. Con `stop`, **detenido**: parado, pero sigue existiendo y guarda lo que ha escrito. Y con `rm`, **eliminado**: desaparece, y con él, su capa de escritura.

*(Señala la flecha de abajo.)* Fijaos en la flecha discontinua: desde detenido puedo volver a arrancarlo con `start`. Parar no es borrar.

Arriba hay un atajo: `docker run` es **crear más arrancar en un solo paso**. Es el que usaremos casi siempre.

Y dos comandos para ver el estado: `docker ps` muestra los contenedores que están en marcha, y `docker ps -a`, con la a de 'all', **todos**, también los parados. Esto lo vamos a usar en un momento de la demo en que algo falla a propósito, y el contenedor se queda en estado 'creado'."

## 13. Puertos: la ventanilla
*(~2 min)*

"Siguiente concepto: los puertos. Un problema práctico: **un contenedor está aislado**. Eso es bueno, pero tiene un efecto: desde fuera, desde mi navegador, no puedo llegar a él por defecto.

Primero, ¿qué es un puerto? Es como **un número de ventanilla**. Un ordenador puede tener muchos programas esperando conexiones, y el puerto es lo que dice a cuál de ellos va dirigida cada petición. Por ejemplo, el Taxímetro escucha en el puerto 8000.

*(Señala el dibujo de izquierda a derecha.)* Mi navegador pide `localhost:8080`, que es **el puerto 8080 de mi máquina**. Docker recibe esa petición y la **redirige** al puerto 8000 que hay **dentro** del contenedor. Eso es publicar un puerto, y se escribe con la opción `-p`.

El formato es: **`-p puerto_de_tu_máquina : puerto_del_contenedor`**. Siempre en ese orden: primero el de tu máquina, a la izquierda; después el del contenedor, a la derecha.

Una precisión: en la diapositiva pongo 8080 a 8000 como ejemplo. **En la demo usaremos 8000 a 8000**, el mismo número en los dos lados. Lo importante es el formato.

Y una regla clave: **el puerto de la izquierda, el de tu máquina, tiene que estar libre.** Solo un programa puede usar un puerto a la vez. Pensad en lo que pasa si dos contenedores intentan usar la misma ventanilla... lo vamos a provocar a propósito en la demo.

Restaurante: la ventanilla por donde sale el plato hacia el cliente. Sin ventanilla, el plato se cocina, pero nadie lo recibe."

## 14. El Dockerfile: la receta escrita
*(~2,5 min)*

"Hemos hablado de que las imágenes se construyen. Pero, ¿construir a partir de qué? De un archivo de texto llamado **Dockerfile**. Es la receta escrita.

Y lo primero que quiero aclarar, porque suele confundir: **un Dockerfile no es un lenguaje de programación.** No hay variables ni bucles. Es **una lista de instrucciones**, una por línea, que Docker lee **de arriba abajo**. Cada instrucción empieza con una palabra en mayúsculas y luego sus argumentos.

*(Señala la columna de la derecha, instrucción por instrucción.)*

- **`FROM`**: de qué imagen parto. Siempre es la primera. Aquí, `python:3.13-slim`: 'empieza con una imagen que ya tiene Python'.
- **`WORKDIR`**: la carpeta de trabajo dentro de la imagen. Es como hacer un `cd`: desde aquí, todo ocurre en esa carpeta.
- **`COPY`**: pasa archivos de mi ordenador a la imagen.
- **`RUN`**: ejecuta un comando **mientras se construye** la imagen. Por ejemplo, instalar las librerías con `pip install`.
- **`ENV`**: define una variable de entorno.
- **`EXPOSE`**: documenta qué puerto usa la app. Ojo: **solo documenta**, no abre nada. Lo que realmente publica el puerto es `-p`, que ya hemos visto.
- **`CMD`**: el comando que se ejecuta **cuando el contenedor arranca**.

Un detalle que lleva a error: **`RUN` se ejecuta al construir; `CMD` se ejecuta al arrancar.** Instalar las librerías es RUN; arrancar el servidor es CMD.

Esta versión es simplificada. El Dockerfile real del Taxímetro lo escribiremos entero en la demo, en directo.

Y una cosa más que os cuento para que veáis cómo encaja con la píldora de la semana que viene: cuando hay **varios contenedores a la vez**, se usa un archivo distinto, `docker-compose.yml`, que está escrito en un formato llamado **YAML**. Eso os lo explica [nombre del compañero] la semana que viene. Hoy nos quedamos con un solo contenedor."

## 15. Multi-stage: cocina y plato final
*(~2 min)*

"Un último concepto de imágenes, que usaremos en el Dockerfile del Taxímetro: **el multi-stage build**, o 'construcción en varias etapas'.

El problema: nuestra aplicación tiene un back en Python y un front en React. Para **compilar** el front necesito Node y todas sus herramientas, que pesan mucho. Pero para **ejecutar** el resultado, ya compilado, no necesito Node para nada.

*(Señala el dibujo de izquierda a derecha.)* Solución: dos etapas en el mismo Dockerfile.

**Etapa 1**, a la izquierda: una imagen con Node, que compila el front y produce una carpeta llamada `dist`, con los archivos finales.

**Etapa 2**, a la derecha: una imagen con Python y mi back. Y de la etapa 1 solo me llevo esa carpeta `dist`, con la instrucción `COPY --from`.

*(Señala la cruz naranja.)* Fijaos: **Node se queda en la etapa 1 y no viaja a la imagen final.** La imagen final es mucho más pequeña.

Y una consecuencia importante: como mi back ya sirve el front compilado, **solo necesito un contenedor**, no uno para el back y otro para el front.

Restaurante: la cocina de preparación y el plato final. **No le sirves las cacerolas al cliente, solo el plato terminado.**"

---

## Sección: Volúmenes

## 16. El problema: los datos se pierden
*(~1,5 min)*

"Entramos en la última parte de la teoría: los volúmenes. Y empiezo por el problema.

*(Señala el dibujo de izquierda a derecha.)* A la izquierda, un contenedor con datos dentro: en nuestro caso, **la cuenta de la empresa, las tarifas y el historial de viajes**. En medio, el comando `docker rm`, que borra el contenedor. Y a la derecha, un contenedor nuevo, creado de la misma imagen... **vacío**.

Lo que había dentro se fue con el contenedor. Es lo que anticipábamos: la capa de escritura es temporal.

En el Taxímetro significa esto: borro el contenedor, lo vuelvo a crear, y la aplicación me pide **registrar la empresa otra vez** y he perdido todo el historial. Imaginad que fuese una base de datos de clientes. Un desastre.

Os acordáis de la pregunta que os hice antes: '¿sigue mi cuenta registrada?' Pues aquí tenéis la respuesta: **sin volumen, no.** La solución: guardar los datos **fuera** del contenedor."

## 17. Tres formas de guardar datos
*(~2,5 min)*

"Docker ofrece **tres formas** de guardar datos fuera de la capa del contenedor. Os las enseño en tres columnas.

**Primera, el volumen con nombre** (named volume). Es un espacio de almacenamiento **que gestiona Docker**: tú le pones un nombre, por ejemplo `datos`, y Docker decide dónde lo guarda en tu disco. Se conecta al contenedor con `-v nombre:ruta`. Aquí: `-v datos:/data`, que quiere decir 'conecta el volumen `datos` a la carpeta `/data` dentro del contenedor'. Es la opción para **datos que tienen que sobrevivir**, como una base de datos.

**Segunda, el bind mount.** En lugar de un espacio que gestiona Docker, **conectas una carpeta real de tu máquina** al contenedor. `-v ./src:/app` quiere decir 'la carpeta `src` de mi ordenador aparece dentro del contenedor como `/app`'. Lo bueno: si edito un archivo en mi editor, **el contenedor lo ve al instante**. Es ideal **para desarrollar**.

**Tercera, tmpfs.** Guarda los datos **en la memoria RAM**, no en el disco. Cuando el contenedor se para, **desaparecen**. Sirve para datos temporales o sensibles que no quieres dejar escritos en ningún sitio, como una clave temporal.

*(Señala la frase de abajo.)* Resumen: **producción, volumen. Desarrollo, bind mount. Datos temporales, tmpfs.**

Restaurante: el volumen es **la despensa del local**, siempre ahí. El bind mount son **ingredientes que traes tú de casa**. El tmpfs es **la pizarra del día**: se borra al cerrar.

Hoy usamos el **volumen con nombre**."

## 18. El volumen sobrevive al contenedor
*(~1 min)*

*(Señala el dibujo.)*

"Veamos qué pasa con un volumen. Arriba a la izquierda, el **contenedor viejo**, con una cruz roja: lo borro con `docker rm`. Abajo, el **volumen**, con la cuenta, las tarifas y el historial. Y arriba a la derecha, un **contenedor nuevo** que se conecta al **mismo volumen**, con `-v`.

¿Resultado? Los datos siguen ahí. Aunque haya borrado el contenedor viejo y creado uno distinto, **el volumen es independiente**: vive fuera.

Restaurante: tiro el plato, pero la despensa sigue llena. Cuando cocino el siguiente plato, saco los ingredientes de la misma despensa.

Y ahora, un cambio de idioma: en la siguiente diapositiva lo repetimos **en inglés**. Tranquilos, va con subtítulos."

---

# BLOQUE INGLÉS (~3 min)

*Habla despacio, una frase cada vez. Haz una pausa tras cada tarjeta. El subtítulo en español está en la diapositiva para el que se pierda.*

## 19. English moment · Volumes

"Okay, now in English. I'll say it slowly, and the Spanish is below each sentence.

**'A container is temporary.'** *(pausa)* A container is temporary. It lives for a while, and then we remove it.

**'When you delete it, its data is gone.'** *(pausa)* 'Gone' means 'desaparecido'. When you delete the container, the data inside is gone. Like the dish: when it's finished, it's gone.

**'A volume lives outside the container.'** *(pausa)* A volume lives outside the container. It is not inside the box. It is next to the box, in a safe place.

*(Señala la frase de abajo.)* Now say it with me, out loud, if you want: **temporary... gone... volume.**

Very good."

## 20. English moment · Why it matters

"Now, why does it matter?

**'Databases, accounts, uploads: keep them in a volume.'** *(pausa)* Databases, accounts, files that users upload. Everything that is important: keep it in a volume.

**'You can replace the container and keep the data.'** *(pausa)* 'Replace' means 'reemplazar', swap one for another. You can replace the container, and keep the data.

**'Update the image, run a new container, same data.'** *(pausa)* This is very useful. When I improve my app, I build a new image, I run a new container, and the users still have the same data.

*(Pregunta al chat, en inglés.)* **Now a question for the chat. In our Taxímetro demo: what do we put in the volume?** You can answer in English or in Spanish. *(Espera.)*

*(Respuesta, aunque contesten mal.)* "The company account, the rates, the ride history, and the log. Everything in the `/data` folder. We will see it live.

And remember the restaurant: **the dish can be thrown away, but the pantry keeps the ingredients.** Let's see it in action."

*(Vuelve al español.)* "Gracias por aguantar mi inglés. Seguimos."

---

# BLOQUE 3. Comandos (~5 min)

*Idea: no leas la tabla entera. Di el comando en inglés, explica en español qué hace. Estos comandos los vas a usar en la demo, así que aquí solo es presentarlos.*

## 21. Comandos: imágenes
*(~1,5 min)*

"Ya sabemos qué es cada cosa. Ahora los comandos para manejarlas. Empiezo con los de imágenes. Todos empiezan por `docker`.

- **`docker build -t taximetro .`** Construye una imagen a partir del Dockerfile. `build` es 'construir'. `-t` es 'tag', le **pone nombre** a la imagen: aquí, `taximetro`. Y el **punto** del final significa 'busca el Dockerfile en esta carpeta'. Es el comando que más usaremos.
- **`docker images`**: lista las imágenes que tengo en mi máquina, con su tamaño.
- **`docker pull python:3.13`**: **descarga** una imagen de Docker Hub. `pull` es 'tirar hacia ti'.
- **`docker rmi taximetro`**: **borra** una imagen. `rmi` es 'remove image'.
- **`docker history taximetro`**: muestra las **capas** de la imagen y cuánto pesa cada una. Es el comando que hace visible lo que vimos con la caché."

## 22. Comandos: contenedores
*(~2 min)*

"Los de contenedores, que son los más usados.

- **`docker run -d -p 8000:8000 --name taxi taximetro`**: crea y arranca un contenedor. Voy por partes. `-d` es 'detached', **en segundo plano**: así me devuelve la terminal y no se queda bloqueada. `-p 8000:8000`, la ventanilla que hemos visto. `--name taxi`, **le pongo nombre**; si no, Docker inventa uno aleatorio, como 'happy_hopper'. Y al final, **la imagen** de la que lo creo.
- **`docker ps`**: lista los contenedores **en marcha**. Y con **`-a`**, todos, también los parados.
- **`docker logs taxi`**: muestra **lo que imprime la aplicación**. Es lo primero que miro si algo falla.
- **`docker stop taxi`** y **`docker start taxi`**: **para** y **vuelve a arrancar**.
- **`docker rm taxi`**: **borra** el contenedor. Tiene que estar parado; si no, se usa `-f` de 'force'.
- **`docker exec -it taxi sh`**: **abre una terminal dentro** del contenedor, para mirar. `exec` es 'ejecutar'. Y `-it` significa 'interactivo', para poder escribir.

Los verbos son los mismos que en el ciclo de vida: run, stop, start, rm."

## 23. Comandos: volúmenes y limpieza
*(~1,5 min)*

"Y los últimos, los de volúmenes.

- **`docker volume create datos`**: crea un volumen con nombre.
- **`docker volume ls`**: lista los volúmenes que hay.
- **`docker volume inspect datos`**: muestra **dónde y cómo** está guardado.
- **`docker run -v datos:/data ...`**: este es el importante. Ya lo conocemos: conecta el volumen `datos` a la carpeta `/data` del contenedor. **Nombre del volumen, dos puntos, ruta dentro del contenedor.**
- **`docker volume rm datos`**: **borra** el volumen **y sus datos**.
- **`docker system prune`**: **limpia** contenedores parados, imágenes sin usar y caché.

Y un aviso, porque es el único sitio donde podéis haceros daño: **`volume rm` y `prune` pueden borrar datos de verdad.** El volumen sobrevive a que borres el contenedor, pero **no** a que lo borres a él. Usadlos con cuidado."

---

# BLOQUE 4. Demo en vivo (~22 min)

## 24. Demo en vivo
*(~1 min. Antes de empezar, comprueba tu lista: Docker Desktop abierto, puerto 8000 libre, navegador en ventana privada.)*

"Hasta aquí la teoría. Ahora lo importante: **vamos a hacerlo de verdad**.

*(Señala el dibujo de izquierda a derecha.)* Este es el camino. Empiezo con un **Dockerfile**, la receta. Con `build` construyo una **imagen**. Con `run` creo un **contenedor**. Y a ese contenedor le conecto un **volumen** para guardar los datos.

Vamos a dockerizar el **Taxímetro**, el proyecto que ya conocemos. Ahora mismo **no tiene ni un archivo de Docker**. Lo escribo todo en directo, desde cero.

Si queréis seguirme, tenéis el repositorio en GitHub, en la dirección que sale abajo, en la **rama `main`**, que es el proyecto sin Docker. Y quien tenga Docker instalado puede ir haciendo los mismos pasos en su máquina.

Antes de empezar: ¿quién tiene Docker abierto? Si podéis, escribid en la terminal `docker --version`. Si no os funciona ahora, no pasa nada: mirad y tomad notas, os dejo el repositorio con todo ya hecho.

Voy a compartir mi pantalla: veréis mi terminal y mi navegador."

*(Cambia a compartir pantalla: terminal + navegador.)*

## 25. Los pasos de la demo (hoja de ruta)
*(~30 s. Déjala en pantalla un momento y luego cambia a la terminal.)*

"Antes de lanzarme, os enseño la hoja de ruta, para que sepáis dónde estamos en cada momento. Son seis pasos:

**Uno**: escribo el `.dockerignore` y el Dockerfile en dos etapas. **Dos**: construyo la imagen, y veremos las capas y la caché. **Tres**: arranco el contenedor con el puerto publicado y registro la empresa en el navegador. **Cuatro**: provoco un **fallo a propósito**, el del puerto ocupado. **Cinco**: **borro el contenedor** y veremos cómo la cuenta desaparece. Y **seis**: repito todo con un **volumen**, y esta vez borro el contenedor y **la cuenta sigue ahí**.

Voy parando en cada paso. Si alguien se pierde, que lo diga en el chat y lo repito."

---

## Narración de la demo (qué dices en cada paso)

*Los comandos exactos están en `DEMO.md`. Aquí solo lo que dices. Si algo falla, el plan B está al final de `DEMO.md`.*

### Paso 1a · Punto de partida (0:00-2:00)
*(Haz `ls` en la rama `main`: solo se ven `back/` y `front/`.)*

"Esto es el Taxímetro tal como está en la rama `main`. Veo la carpeta `back`, con el servidor en Python, y `front`, con la parte visual en React. **No hay ningún archivo de Docker.** Hoy, esto solo funciona si tienes Python 3.13 y Node 20 instalados. Vamos a meterlo en un contenedor para que funcione en cualquier máquina."

*(Predicción al chat.)* "Os pregunto: ahora mismo hay cero archivos de Docker. Al terminar la sesión, ¿cuántos creéis que habré necesitado? ¿2, 3 o 5?" *(Respuesta: 2: `.dockerignore` y `Dockerfile`.)*

### Paso 1b · `.dockerignore` (2:00-4:00)
*(Escribe el archivo.)*

"El primer archivo se llama `.dockerignore`. Dice a Docker **qué NO copiar** dentro de la imagen. *(En inglés, una frase:)* **'This file tells Docker what NOT to copy into the image.'**

¿Por qué es importante? Mirad lo que voy a excluir: mi **base de datos local**, mi archivo `auth.ini` con **mi contraseña**, el `.git`, y `node_modules`, que pesa cientos de megas. Si no lo pongo, **todo eso entraría dentro de la imagen**: copiaría mi contraseña y mi base de datos a una imagen que luego podría compartir. Eso es un fallo de seguridad real. Es lo que se queda fuera del menú."

### Paso 1c · Dockerfile (4:00-10:00)
*(Antes de escribir, recuerda la diapositiva 15 en una frase.)* "Voy a escribir el Dockerfile en dos tandas, una por cada etapa del multi-stage que vimos."

**Tanda 1, la cocina de preparación (compilar el front)**
"Empiezo con `FROM node:20-slim AS front`. `FROM`, la imagen base: una con Node. Y `AS front` le pone **nombre a esta etapa**, para luego referirme a ella.

`WORKDIR /front`: trabajo en la carpeta `/front` dentro de la imagen.

Ahora fijaos en el orden, que es lo de las capas: **primero** copio solo `package.json`, el archivo con la lista de dependencias, **y luego** ejecuto `npm ci` para instalarlas. Y **después** copio el resto del código y compilo con `npm run build`. ¿Por qué en ese orden? Por la caché: si no cambio mis dependencias, la capa de `npm ci` sale de la caché y **no se reinstala todo cada vez**."

**Tanda 2, la imagen final (el plato servido)**
"Ahora la segunda etapa, que es la imagen final: `FROM python:3.13-slim`. Otra imagen base, esta vez con Python. **Aquí no hay Node.**

Instalo las librerías del back: copio `requirements.txt` primero y hago `pip install`, por la misma razón de la caché. Luego copio mi código.

Y ahora lo importante: `COPY --from=front /front/dist front/dist`. Esto dice: 'de la etapa que se llama `front`, cógeme **solo** la carpeta `dist`, que es el front ya compilado'. **Me llevo el resultado, no las cacerolas.** Node se queda atrás.

Después `WORKDIR /data`. Esta es la **carpeta donde la aplicación guardará sus datos**: cuenta, tarifas, historial y log. Acordaos de `/data`, que lo vamos a necesitar en cuanto lleguemos a los volúmenes.

`ENV PYTHONPATH=/app/back` es una variable de entorno para que Python encuentre mi código. `EXPOSE 8000` documenta el puerto, aunque, recordad, no lo abre.

Y por último el `CMD`, que arranca el servidor: `uvicorn taximetro.api:app`. Un detalle: lleva `--host 0.0.0.0`. Eso quiere decir 'escucha peticiones **desde fuera del contenedor**'. Si dejara el valor por defecto, solo escucharía dentro y no podría entrar desde mi navegador.

Recordad: **RUN es al construir, CMD es al arrancar.**"

### Paso 2 · Build (10:00-12:00)
*(Lanza `docker build -t taximetro .`)*

"Construyo la imagen: `docker build -t taximetro .` Con `-t` le pongo el nombre `taximetro`, y el punto significa 'el Dockerfile está aquí'.

*(Mientras corre, señala las líneas de la salida.)* Mirad la salida. Cada paso que veis es **una capa**. Si es la primera vez, tarda: está descargando las imágenes base y compilando el front. Si ya lo había hecho en un ensayo, veréis la palabra **`CACHED`**: esa capa se reutiliza."

*(Cuando termine, `docker images`.)* "`docker images` y ahí está: `taximetro`, con su tamaño. **Esta imagen no lleva Node**; solo el resultado de compilar."

*(Predicción al chat.)* "Ahora cambio **una línea** del código Python y vuelvo a construir. ¿Tarda minutos o segundos?" *(Toca un archivo de `back/`, repite `docker build`. Señala `CACHED` en las capas de las dependencias.)* "Segundos. Las capas de dependencias salen de la caché y solo se rehace mi código. Esto es lo que os explicaba con las capas."

### Paso 3 · Run y primer viaje (12:00-14:00)
*(Lanza `docker run -d --name taxi -p 8000:8000 taximetro`, `docker ps`, `docker logs taxi`.)*

"Ahora arranco el contenedor. `-d` en segundo plano, `--name taxi` para ponerle nombre, y `-p 8000:8000`, la ventanilla: el puerto 8000 de mi máquina al 8000 del contenedor.

`docker ps` y ahí está, en marcha. `docker logs taxi`, y veo lo que imprime la aplicación: ha arrancado.

*(Abre el navegador en ventana privada: `http://localhost:8000`.)* Abro el navegador. **Esto no es el servidor de mi máquina: es el contenedor.** Ya no uso mi Python local.

La aplicación me pide **registrar una empresa** con una contraseña: es la primera vez que entra alguien. La registro. Ahora hago un viaje: lo inicio, lo pongo en movimiento, espero unos segundos y lo termino. Y miro el **historial**: ahí está mi viaje."

*(Opcional: `docker exec -it taxi ls /data`.)* "Si miro dentro del contenedor con `docker exec`, en `/data` están la configuración, la base de datos, la cuenta y el log. **Aquí viven los datos**, dentro de la capa de escritura del contenedor."

### Paso 4 · Fallo controlado (14:00-16:00)
*(Predicción al chat primero.)* "Os pido otra apuesta antes de lanzar el comando. Voy a arrancar **otro contenedor idéntico en el mismo puerto 8000**. ¿Qué pasa? Opción A: funciona. Opción B: da error."

*(Ejecuta `docker run -d --name taxi2 -p 8000:8000 taximetro`. Sale `port is already allocated`.)*

"¡Error! **'Port is already allocated'**: el puerto ya está asignado. Es exactamente lo que decíamos con la ventanilla: **solo un programa puede usar el puerto 8000 de mi máquina**, y ya lo tiene el primer contenedor."

*(Deja que el chat sugiera la causa y el arreglo. Después:)* "Mirad un detalle del ciclo de vida. `docker ps -a`: ¡`taxi2` aparece como **Created**! El contenedor se creó pero no llegó a arrancar. Existe, pero no funciona. Hay que borrarlo: `docker rm taxi2`.

Y lo arreglo cambiando la ventanilla de **mi** lado: `-p 8001:8000`. El contenedor sigue usando el 8000 por dentro, pero desde fuera lo veo en el 8001."

*(`docker run -d --name taxi3 -p 8001:8000 taximetro`, luego `docker ps`.)* "Ahora tengo **dos contenedores de la misma imagen**. Como en el dibujo de una imagen, muchos contenedores. Entro en `localhost:8001`: **otra aplicación, vacía**, me pide registrar la empresa de nuevo. Cada contenedor tiene **sus propios datos**, aislados." *(Limpia: `docker rm -f taxi3`.)*

### Paso 5 · Borrar el contenedor: los datos se pierden (16:00-18:00)
*(Predicción al chat.)* "Esta es la pregunta que dejé antes. Voy a **borrar el contenedor** y crear uno nuevo de la misma imagen. ¿El viaje que hice sigue en el historial? ¿Sí o no?" *(Espera.)*

*(Ejecuta `docker rm -f taxi` y vuelve a lanzar `docker run -d --name taxi -p 8000:8000 taximetro`. Recarga el navegador.)*

"Y ahí está: **me pide registrar la empresa otra vez.** Está todo vacío, sin cuenta, sin tarifas, sin historial. Lo hemos perdido todo.

El contenedor es el plato. Lo tiré, y con él, todo lo que tenía dentro. **Necesitamos la despensa.**"

### Paso 6 · El volumen (18:00-22:00)
*(Ejecuta `docker rm -f taxi`, `docker volume create taxi-data`, y `docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro`. Luego `docker volume ls`.)*

"Primero **creo el volumen**: `docker volume create taxi-data`. Con `docker volume ls` lo veo en la lista. Y ahora arranco el contenedor igual que antes, **con una opción nueva**: `-v taxi-data:/data`.

Esto dice: 'conecta el volumen `taxi-data` a la carpeta `/data` del contenedor'. Y `/data` es justo la carpeta que decidimos en el Dockerfile. **Todo lo que la aplicación escriba ahí irá al volumen, fuera del contenedor.**

*(En el navegador: registra la empresa, haz un viaje, mira el historial.)* Registro la empresa, hago un viaje... y ahí está en el historial."

*(Predicción al chat.)* "Ahora la prueba final. **Voy a borrar el contenedor** otra vez. ¿Sobrevive el viaje?"

*(Ejecuta `docker rm -f taxi` y `docker run -d --name taxi -p 8000:8000 -v taxi-data:/data taximetro`. Recarga el navegador.)*

"Fijaos: **ya no me pide registrar la empresa. Me pide hacer login.** Entro con mi contraseña... y **el historial sigue ahí**. 🎉

El contenedor es nuevo, pero el volumen es el mismo. Es lo que decíamos: tiro el plato, la despensa sigue llena."

*(Opcional si sobra tiempo: `docker volume inspect taxi-data`.)* "Con `inspect` veo dónde guarda Docker este volumen."

"Un aviso honesto: si ahora hago `docker volume rm taxi-data`, ahí sí se pierde todo. **El volumen sobrevive al contenedor, no a que lo borres a él.**"

### Cierre de la demo (~1 min)
"Resumen de lo que hemos hecho, y os lo digo en inglés para repasar vocabulario:
**'We wrote a Dockerfile.'** Escribimos la receta. **'We built an image and ran a container.'** Construimos la imagen y arrancamos el contenedor. **'We added a volume, and the data survived.'** Añadimos un volumen y los datos sobrevivieron."

*(Limpieza opcional: `docker rm -f taxi`, `docker volume rm taxi-data`.)*

---

# BLOQUE 5. Cierre (~5 min)

## 26. Lo que nos llevamos
*(~1 min)*

*(Vuelve a la presentación.)*

"Para cerrar, tres ideas. Si me he explicado bien, ya las podéis contar vosotros.

**Imagen**: la receta lista. Solo lectura, hecha de capas. **Contenedor**: el plato servido. Temporal, aislado, desechable. **Volumen**: la despensa. Los datos sobreviven al contenedor.

Y si tenéis que recordar **una sola cosa**, mirad la frase de abajo: **el contenedor se borra, el volumen se queda.**

Y para quedaros con ganas: hoy hemos trabajado con **un solo contenedor**. La semana que viene, [nombre del compañero] os enseña **Docker Compose y microservicios**: cómo levantar **varios contenedores a la vez** y que hablen entre sí. Es la continuación natural de lo de hoy."

## 27. Kahoot
*(~5 min. Antes de la sesión, crea el Kahoot y escribe el PIN en la diapositiva; ahora pone `______`.)*

"Y para terminar, un poco de juego. Vamos a ver quién se ha quedado con más. Entrad en **kahoot.it** desde el móvil o el ordenador, y escribid el PIN que sale en pantalla. *(Espera a que entren.)* Hay preguntas de lo que hemos visto, y alguna en inglés. ¡Vamos!"

*(Ideas de preguntas en `DEMO.md`, sección Kahoot.)*

## 28. Repo y recursos
*(~1 min)*

"Todo lo de hoy está en un repositorio de GitHub: `github.com/Charlottedoulcet/docker-pildora`.

Tiene dos ramas. La **`main`** es el Taxímetro **sin Docker**, para que podáis hacer la demo desde cero, como yo. La **`solution`** tiene ya el `Dockerfile`, el `.dockerignore` y una chuleta con los comandos, por si os atascáis.

Eso es todo por mi parte. ¿Preguntas, dudas, memes de ballenas? **Thank you!**"

---

# Preguntas probables (para tenerlas a mano)

**¿Qué diferencia hay entre una imagen y un contenedor?**
"La imagen es la receta con los ingredientes: no se modifica. El contenedor es esa receta ya cocinándose, con una capa donde puede escribir. De una imagen salen muchos contenedores."

**¿Qué es el kernel otra vez?**
"El núcleo del sistema operativo: la pieza que habla con el hardware. Los programas le piden cosas (leer un archivo, usar la red) y él las hace. Los contenedores comparten el de tu máquina; una máquina virtual lleva el suyo propio."

**Si comparten kernel, ¿puedo ejecutar un contenedor de Linux en Windows?**
"Sí. Docker Desktop lleva una mini máquina virtual con Linux por debajo, y los contenedores comparten el kernel de esa."

**¿Por qué no uso máquinas virtuales entonces?**
"Las máquinas virtuales aíslan más fuerte (cada una tiene su sistema operativo completo), pero son más pesadas y lentas de arrancar. Para empaquetar aplicaciones, los contenedores son mucho más cómodos."

**¿Dónde se guardan físicamente los volúmenes?**
"Los gestiona Docker en su propio espacio de tu disco. Con `docker volume inspect` ves la ruta. En Mac y Windows está dentro de esa mini máquina Linux, así que no navegas hasta él como una carpeta normal. Para ver los datos, mejor entrar con `docker exec`."

**¿Y si quiero ver los archivos desde mi editor?**
"Eso es un bind mount, no un volumen: conectas una carpeta de tu máquina. Más cómodo para desarrollar; para producción, volumen."

**¿Qué hago si me sale 'port is already allocated'?**
"Ese puerto de tu máquina ya lo usa algo (otro contenedor u otro programa). Cambia el puerto de la izquierda del `-p`, por ejemplo 8001:8000, o para el que lo está usando."

**¿Cuál es la diferencia entre `docker run` y `docker start`?**
"`run` crea un contenedor nuevo y lo arranca. `start` arranca uno que ya existe y estaba parado."

**¿Y si cambio mi código? ¿Tengo que reconstruir?**
"Sí: la imagen es de solo lectura, así que hay que hacer `docker build` otra vez. Gracias a la caché, solo se rehacen las capas que cambian. En desarrollo, con un bind mount, ves los cambios sin reconstruir."

**¿Qué es Docker Hub?**
"Un sitio público donde hay imágenes ya hechas: Python, Node, Postgres... Se bajan con `docker pull`. El libro de recetas."

**¿Docker Compose es lo mismo?**
"No: es otra herramienta para levantar varios contenedores a la vez con un solo archivo (YAML). Lo explica [compañero] la semana que viene."

---

# Checklist antes de empezar
- [ ] Repo **público** (ahora es privado): `gh repo edit --visibility public --accept-visibility-change-consequences`
- [ ] PIN del Kahoot escrito en la diapositiva 27
- [ ] Dockerfile **probado una vez entero** (nunca se ha ejecutado) y quitado el aviso "SIN PROBAR" de `DEMO.md`
- [ ] Docker Desktop abierto, puerto 8000 libre, navegador en **ventana privada**
- [ ] Presentación en modo Present; este archivo y `DEMO.md` en otra pantalla
- [ ] `git checkout main` en la carpeta que enseñas (para que se vea sin Docker)
- [ ] Sustituir `[nombre del compañero]` por su nombre
