---
name: mi-claude-md
description: "Entrevista al usuario sobre a qué se dedica, cómo trabaja y qué le molesta de las respuestas de la IA, y con eso le escribe su archivo de instrucciones globales de Claude Code. Usar cuando el usuario quiera personalizar cómo le responde Claude, que Claude lo conozca, configurar sus instrucciones o preferencias globales, o cuando se queje de que las respuestas le salen genéricas, largas o con un tono que no es el suyo."
version: 1.0.0
domain: meta
audience: bootcamp-cc
complexity: standalone
triggers:
  - mi claude md
  - configurar como me responde
  - que claude me conozca
  - instrucciones globales
  - personalizar claude
  - las respuestas me salen genericas
  - que me hable distinto
---

# Mi CLAUDE.md

Escribe el archivo de instrucciones que Claude lee al empezar cada conversación.

Es el skill de mayor efecto del kit. Casi todo lo que la gente vive como "la IA
no me entiende" es este archivo vacío.

## Antes de empezar

Fijate si ya existe `~/.claude/CLAUDE.md` y **leelo antes de tocar nada**. Si
tiene contenido, no lo pises: al final vas a proponer una versión combinada y el
usuario decide.

---

## Paso 1 — La entrevista

Ocho preguntas. **De a una por vez**, esperando respuesta. Nunca las tires todas
juntas: el usuario abandona.

1. ¿A qué te dedicás? Contámelo como se lo contarías a alguien en un asado.
2. ¿Para qué vas a usar Claude más seguido?
3. Cuando te responde algo y te da fastidio, ¿qué suele ser?
4. ¿Preferís respuestas cortas y al hueso, o que te explique el razonamiento?
5. ¿Hay algo que quieras que **nunca** haga? Por ejemplo: usar emojis, felicitarte
   antes de contestar, inventar datos cuando no sabe.
6. ¿Con qué nombres trabajás todos los días? Clientes, productos, herramientas,
   gente del equipo.
7. ¿En qué idioma querés que te hable, y de vos o de usted?
8. ¿Hay algo que tengas que repetirle cada vez que le pedís algo?

La 3 y la 8 son las que más rinden. Si el usuario contesta corto, repreguntá una
vez: *"dame un ejemplo de la última vez que te pasó"*. Un ejemplo concreto vale
más que tres adjetivos.

Si contesta "no sé" a alguna, saltala. Un archivo con seis secciones buenas es
mejor que uno con ocho tibias.

## Paso 2 — Traducí respuestas en reglas

Este es el trabajo real. Lo que el usuario dice en lenguaje natural hay que
convertirlo en instrucciones que cambien el comportamiento.

| Lo que dice el usuario | Lo que va en el archivo |
|---|---|
| "me habla como un robot vendedor" | No abrir con felicitaciones ni entusiasmo. Ir directo a la respuesta. |
| "me da textos larguísimos" | Respuestas breves por defecto. Extenderse solo si lo pido. |
| "a veces se inventa cosas" | Si no sabés algo, decilo. Nunca completar con datos plausibles. |
| "siempre le tengo que aclarar que soy de Argentina" | Español rioplatense. Vos, no tú. |

La regla para cada línea: **si no cambia lo que Claude va a hacer, no va.**
"Sé útil y profesional" no cambia nada. "No me resumas lo que acabás de hacer"
sí.

## Paso 3 — Escribí el archivo

Guardá en `~/.claude/CLAUDE.md` con esta estructura:

```markdown
# Sobre mí
<a qué se dedica, en 2-3 líneas, y para qué usa Claude>

# Cómo quiero que me respondas
<idioma, tratamiento, largo, tono — reglas concretas>

# Nunca
<la lista de lo que no tiene que hacer>

# Mi contexto
<nombres propios: clientes, productos, herramientas, equipo>

# Reglas de trabajo
<lo que hoy repite en cada pedido>
```

Secciones vacías no se ponen. Se sacan.

**Si ya había un archivo**: mostrale al usuario la versión combinada antes de
guardar, señalando qué se agrega y qué se mantiene. Nunca borres una línea que
escribió él sin decírselo.

## Paso 4 — Explicáselo y cerrá el loop

Mostrale el archivo y recorré cada sección en una línea: qué hace y qué pasaría
si la sacara. Es su archivo, tiene que poder editarlo solo después.

Decile las dos cosas que nadie le dice y todos descubren tarde:

- **Los cambios entran en la próxima conversación**, no en esta.
- **Es un archivo vivo.** Cada vez que se encuentre corrigiendo lo mismo dos
  veces, esa corrección es una línea nueva acá.

Cerrá invitándolo a volver en una semana con lo que le siguió molestando.

---

## Reglas

- **Una pregunta por vez.** Ocho de golpe es un formulario, y los formularios se
  abandonan.
- **Nunca pises un archivo existente sin mostrar el cambio.**
- **Ninguna línea decorativa.** Si no modifica el comportamiento, afuera.
- **No inventes preferencias.** Lo que el usuario no dijo, no va.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Entrevistar → traducir →
escribir → explicar. El paso de traducción (2) es el que casi todos se saltean:
si escribís en el archivo las palabras textuales del usuario, te queda un texto
lindo que no cambia nada. El trabajo es convertir "me habla raro" en una
instrucción que se pueda obedecer.

**Qué decisión podés copiar en el tuyo.** Las preguntas 3 y 8 no preguntan qué
quiere el usuario — preguntan **qué le molesta** y **qué repite**. La gente no
sabe describir lo que quiere, pero describe perfecto lo que la irrita y lo que ya
está cansada de tipear. Si tu skill necesita entender a alguien, preguntale por
la fricción, no por el ideal.

**Qué pasaría si sacaras esta parte.** Sin el Paso 4, el usuario termina con un
archivo que funciona y que no entiende. A la semana necesita cambiar algo, no
sabe dónde tocar, y el archivo se congela. Un entregable que el usuario no puede
mantener solo tiene fecha de vencimiento.

**Por qué de a una pregunta.** Es la decisión más chica y la que más cambia el
resultado. Ocho preguntas juntas se contestan con ocho frases de cinco palabras.
De a una, con repregunta, salen ejemplos concretos — y de los ejemplos concretos
salen las reglas que sirven.
