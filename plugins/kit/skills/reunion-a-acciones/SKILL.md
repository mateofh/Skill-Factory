---
name: reunion-a-acciones
description: "Convierte la transcripción o las notas de una reunión en decisiones tomadas, acciones con dueño y fecha, y el correo de seguimiento listo para enviar. No necesita ninguna conexión: el usuario pega el texto. Usar cuando el usuario quiera sacar la minuta o el resumen de una reunión, saber qué quedó definido, armar el seguimiento, o pasar sus notas a tareas concretas."
version: 1.0.0
domain: operate
audience: bootcamp-cc
complexity: standalone
triggers:
  - pasar la reunion a acciones
  - que quedo de la reunion
  - minuta
  - resumen de la reunion
  - mandar el seguimiento
  - notas de la reunion
  - sacar las tareas de la reunion
---

# Reunión a acciones

De una hora de conversación a una página que dice qué se decidió, quién hace
qué, y qué quedó sin cerrar.

## Antes de empezar

El usuario pega la transcripción o sus notas. No hace falta ninguna conexión.

Si el texto es muy corto o son notas sueltas, sirve igual — vas a tener más
huecos, y los huecos se marcan, no se rellenan.

---

## Paso 1 — Separá tres cosas que no son lo mismo

Este paso es todo el skill. La mayoría de las minutas mezclan estas tres y por
eso no sirven para nada tres semanas después:

| | Qué es | Cómo se reconoce |
|---|---|---|
| **Decisión** | Se resolvió algo. Ya no se discute. | "Vamos con", "queda definido", "arrancamos por" |
| **Acción** | Alguien va a hacer algo concreto. | Hay un verbo, y alguien que lo ejecuta |
| **Conversación** | Se habló. No se resolvió ni se asignó. | "Habría que", "estaría bueno", "en algún momento" |

Lo que quedó en conversación **no se promueve a acción**. Es la tentación más
fuerte y el error más caro: inventás compromisos que nadie tomó, los mandás por
correo, y la próxima reunión empieza con gente a la defensiva.

## Paso 2 — Completá las acciones, o marcá el hueco

Cada acción necesita tres datos: **qué**, **quién**, **cuándo**.

Cuando falta alguno:

- **Falta el quién** → `SIN DUEÑO`. No se lo asignes al que lo propuso, no se lo
  asignes al usuario. Una acción sin dueño es el hallazgo más útil de toda la
  minuta: es lo que se iba a caer sin que nadie se enterara.
- **Falta el cuándo** → `SIN FECHA`. No inventes "esta semana".
- **Falta el qué** — está vago → escribilo como se dijo y marcalo `POR DEFINIR`.

Estas marcas van visibles en el entregable. Son el valor, no un defecto de la
transcripción.

## Paso 3 — Anotá lo que quedó abierto

Los temas que se tocaron y no se cerraron. Una línea cada uno, con qué falta para
poder decidir.

Sin esto, la próxima reunión vuelve a empezar de cero sobre lo mismo.

## Paso 4 — Escribí el correo de seguimiento

Corto. Estructura:

1. Una línea de contexto: qué reunión, cuándo.
2. Lo que se decidió — en viñetas, sin adornos.
3. Quién hace qué y para cuándo — en viñetas.
4. Lo que falta definir, con la pregunta concreta que hay que responder.
5. Cierre de una línea.

Si el usuario tiene perfil de voz en `~/.claude/kit-voz.md`, usalo.

Las acciones `SIN DUEÑO` van en el correo **como pregunta abierta**: *"¿Quién
toma esto?"*. Es la forma de que se asignen sin que el usuario tenga que
asignarlas él.

**Nunca lo envíes.** Entregá el texto para que el usuario lo revise y lo mande.

## Paso 5 — Entregá

```
DECISIONES        Lo que quedó resuelto
ACCIONES          Tabla: qué / quién / cuándo — con las marcas visibles
SIN CERRAR        Temas abiertos y qué falta para decidirlos
CORREO            El borrador de seguimiento, listo para copiar
```

Si el usuario tiene el kit configurado, ofrecé pasar sus acciones a los
pendientes que usa `armar-semana`.

---

## Reglas

- **Nunca promuevas una conversación a acción.** Si nadie se comprometió, no hubo
  compromiso.
- **Nunca inventes un dueño ni una fecha.** `SIN DUEÑO` y `SIN FECHA` son
  respuestas correctas.
- **Nunca envíes el correo.**
- **Nunca cites textual algo que no está en el texto** que te pasaron.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Separar → completar → marcar
huecos → redactar. La separación va primero porque contamina todo lo demás: si
empezás redactando el correo, vas a escribir en tono de compromiso cosas que
fueron comentarios al pasar, y el correo se vuelve una acusación involuntaria.

**Qué decisión podés copiar en el tuyo.** El `SIN DUEÑO` del Paso 2. Casi todos
los skills que procesan información tratan a los huecos como algo a resolver —
rellenan con lo más probable. Acá el hueco **es el entregable**: la acción que
nadie tomó es la información más valiosa de la reunión. Cuando tu skill se
encuentre con un dato faltante, preguntate si ese faltante no es en realidad el
hallazgo.

**Qué pasaría si sacaras esta parte.** Sin la distinción del Paso 1 tenés un
resumen. Los resúmenes de reunión son abundantes, gratis y casi inútiles: te
cuentan de qué se habló, que es justo lo que ya sabías porque estuviste ahí.

**Dónde le pusimos el freno.** El correo se redacta pero no se manda. Un correo
de seguimiento fija la versión oficial de lo que pasó en una reunión — es un
documento con consecuencias. Ese apretón de botón se lo dejamos a la persona que
va a tener que sostener lo que dice.
