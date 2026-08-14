---
name: configurar-mi-kit
description: "Prepara el kit de productividad la primera vez. Detecta si el usuario tiene conectado Gmail o Microsoft 365, verifica que responda de verdad, y deja anotado el proveedor para que ningún otro skill vuelva a preguntar. Si no hay nada conectado, dicta los pasos exactos para conectarlo. Usar cuando el usuario diga que es su primera vez, que quiere configurar o empezar con el kit, que quiere conectar su correo, o cuando otro skill del kit falle por falta de conector."
version: 1.0.0
domain: meta
audience: bootcamp-cc
complexity: standalone
triggers:
  - configurar mi kit
  - empezar con el kit
  - conectar mi correo
  - conectar mi calendario
  - primera vez
  - no me anda ningun skill
  - preparar el kit
---

# Configurar mi kit

Es el primer skill que corre el usuario. Deja el kit listo y anota qué tiene
conectado, para que los demás skills no lo interroguen en cada uso.

**El caso principal es que el usuario no tenga nada conectado.** No es el borde
raro: es lo más probable. Tratalo como el camino normal, no como un error.

## Antes de empezar

Nada. Este skill funciona con el usuario recién instalado y sin ninguna
integración.

---

## Paso 1 — Mirá qué hay conectado

Revisá qué herramientas tenés disponibles en esta sesión y clasificá:

| Si ves herramientas de… | Proveedor |
|---|---|
| Gmail, Google Calendar | `google` |
| Microsoft 365, Outlook | `microsoft` |
| ninguna de las dos | `ninguno` |

Si no aparecen en tu lista de herramientas, buscalas antes de concluir que no
están — pueden estar disponibles sin haberse cargado todavía.

Correo y calendario se anotan por separado: alguien puede tener uno y no el otro.

**No le muestres esta tabla al usuario.** Es para vos.

## Paso 2 — Verificá que respondan de verdad

Que la herramienta exista no significa que esté autorizada. Hacé **una** lectura
mínima y barata de cada una:

- Correo: pedí el mensaje más reciente. Alcanza con saber que devuelve algo.
- Calendario: pedí los eventos de hoy.

No escribas nada. No mandes correos de prueba, no crees eventos de prueba. Una
lectura y listo.

Si la llamada falla por autorización, tratalo como `ninguno` para ese servicio y
seguí al Paso 3 — no reintentes, no busques otra vía.

## Paso 3 — Si falta algo, dictá los pasos

Cuando correo o calendario den `ninguno`, explicale al usuario cómo conectarlo.
Reglas para este mensaje:

- Numerado, un paso por línea, cada paso una sola acción.
- Nombrá lo que va a ver en pantalla, no lo que pasa por detrás.
- Nunca digas "MCP", "conector remoto", "OAuth", "servidor" ni "token".
- Decile que se conecta desde la configuración de su cuenta en el navegador, no
  desde acá. Este es el punto que más confunde: la conexión **no se hace desde
  la terminal**.
- Cerrá con qué tiene que hacer cuando termine: volver y decirte "listo".

Preguntale primero qué usa, si no lo sabés todavía: *"¿Tu correo de trabajo es
de Google (Gmail) o de Microsoft (Outlook)?"* — con esas dos palabras entre
paréntesis, porque mucha gente no sabe el nombre del proveedor pero sí reconoce
el de la aplicación.

Si el usuario dice que no quiere conectar nada, está perfecto: anotá `ninguno` y
seguí. Siete de los once skills del kit no necesitan ninguna conexión, y los
otros cuatro tienen modo manual. Decíselo, así no siente que quedó afuera.

## Paso 4 — Anotá el resultado

Escribí `~/.claude/kit-config.md`. Si ya existía, actualizalo en vez de
duplicarlo.

```markdown
# Configuración del kit

- proveedor-correo: google | microsoft | ninguno
- proveedor-calendario: google | microsoft | ninguno
- nombre: <cómo quiere que le digan>
- verificado: <fecha de hoy>
```

Este archivo es el contrato con el resto del kit. `triage-correo`,
`armar-semana` y `preparar-reunion` lo leen antes de preguntar nada. Si no
existe, esos skills asumen `ninguno` y arrancan en modo manual.

Preguntale el nombre solo si no surgió naturalmente. No hagas una entrevista.

## Paso 5 — Decile qué puede usar

Cerrá con una lista corta de qué le quedó disponible. Agrupá en dos: lo que
anda ya, y lo que se destraba si conecta. Nada más — este skill no enseña a usar
los otros, solo deja el terreno listo.

Sugerile uno solo como próximo paso, y que sea `mi-claude-md`: es el que más
cambia la calidad de todo lo demás.

---

## Reglas

- **Nunca escribas en la cuenta del usuario.** Este skill solo lee. No manda
  correos, no crea eventos, no archiva nada.
- **Una verificación por servicio.** Si falla, anotá `ninguno` y seguí. No
  reintentes ni pruebes rutas alternativas.
- **Nada de jerga en lo que ve el usuario.** Estas instrucciones son técnicas
  porque las leo yo; lo que sale a pantalla, no.
- **Si algo sale mal, decilo.** Nunca informes que quedó conectado algo que no
  verificaste.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Primero detectar, después
verificar, después anotar. Podría parecer redundante detectar y verificar por
separado, pero son dos preguntas distintas: "¿existe la herramienta?" y "¿está
autorizada?". Separarlas es lo que hace que el mensaje de error sea útil — el
usuario que nunca conectó nada necesita instrucciones distintas del que conectó
y se le venció el permiso.

**Qué decisión podés copiar en el tuyo.** El archivo de configuración del Paso 4.
Cuando varios skills necesitan el mismo dato, uno solo lo pregunta y lo deja
escrito; los demás lo leen. Sin eso, cada skill interroga al usuario otra vez, y
un kit que pregunta lo mismo cinco veces se abandona en una semana.

**Qué pasaría si sacaras esta parte.** Si sacás el Paso 2, el kit te va a decir
"todo listo" y después va a fallar en medio del triage de correo, cuando ya
tenías la expectativa puesta. Verificar temprano cuesta una llamada barata y
evita la peor forma de falla: la que aparece tarde y parece culpa tuya.

**El detalle que más se copia mal.** Fijate que hay dos registros de lenguaje
conviviendo: las instrucciones que leo yo son técnicas y directas, y lo que sale
a pantalla no tiene una sola palabra técnica. Cuando escribas el tuyo, tené
claro cuál de los dos estás escribiendo en cada línea.
