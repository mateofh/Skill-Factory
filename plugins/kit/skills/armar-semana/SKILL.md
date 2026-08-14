---
name: armar-semana
description: "Toma el calendario y los pendientes del usuario y arma la semana: qué entra, qué no entra, dónde van los bloques de trabajo profundo y qué reunión conviene mover o rechazar. Funciona con Google Calendar, con Microsoft 365, o a mano. Usar cuando el usuario quiera planificar u organizar su semana o su agenda, cuando diga que no le alcanza el tiempo, o cuando pregunte cómo ordenar los próximos días."
version: 1.0.0
domain: operate
audience: bootcamp-cc
complexity: standalone
triggers:
  - armar mi semana
  - planificar la semana
  - organizar mi agenda
  - no me alcanza el tiempo
  - como ordeno la semana
  - donde meto el trabajo importante
  - plan de la semana
---

# Armar mi semana

Arma la semana a partir de las horas que realmente hay, no de las que harían
falta.

Un plan que no rechaza nada no es un plan: es una lista de deseos con días
puestos al lado.

## Antes de empezar

Leé `~/.claude/kit-config.md` para saber si hay calendario conectado. Sin
archivo, asumí que no y usá el modo manual.

---

## Paso 1 — Contá las horas que quedan

Antes de mirar un solo pendiente, calculá la capacidad real:

- **Con calendario conectado**: traé los eventos de los próximos 7 días.
- **Sin nada conectado**: pedile al usuario que te dicte sus compromisos fijos de
  la semana. Con día, hora y duración alcanza.

Después restá, en este orden:

1. Las horas ya comprometidas en el calendario.
2. Un 20% de colchón sobre lo que queda. Siempre. Las semanas se desbordan por
   lo que no estaba agendado, no por lo que sí.
3. Las horas en que la persona no rinde para trabajo profundo. Preguntale una
   vez cuándo trabaja mejor, si no lo sabés, y anotalo en `~/.claude/kit-config.md`.

Lo que sobra es lo que hay. **Ese número se le dice al usuario antes de
planificar nada**, porque es el que cambia la conversación.

## Paso 2 — Traé los pendientes

De donde estén: lo que el usuario diga, lo que haya dejado `cierre-del-dia`, lo
que haya salido de `triage-correo` o de `reunion-a-acciones`.

Para cada uno necesitás dos datos, y si faltan, preguntá:

- **Cuánto lleva** — en horas, estimado por el usuario. No lo estimes vos.
- **Qué pasa si no se hace esta semana** — la respuesta real, no la dramática.

Si el usuario no sabe cuánto lleva algo, es señal de que la tarea está mal
definida. Decíselo y partila en dos antes de seguir.

## Paso 3 — Decidí qué entra

Ordená los pendientes por consecuencia de no hacerlos, y andá llenando las horas
disponibles hasta que se acaben.

Cuando se acaban, se acaban. **Lo que sigue queda afuera y se dice en voz alta.**

Reglas de asignación:

- Lo que exige cabeza va en las horas buenas del usuario. Lo administrativo va en
  las malas. Al revés es el error más común y el más caro.
- Bloques de 90 minutos como máximo para trabajo profundo. Más largo no se
  sostiene.
- Nada de dos cosas grandes el mismo día.
- Dejá un bloque sin asignar por día. Se va a llenar solo.

## Paso 4 — Mirá las reuniones con ojo crítico

Para cada reunión de la semana, una pregunta: **¿qué se rompe si esta no pasa?**

Marcá las que caen en alguna de estas:

- No tiene objetivo claro ni nada que decidir.
- El usuario no aporta ni se lleva nada — va de oyente.
- Podría ser un mensaje.
- Parte en dos un bloque de trabajo profundo, y correrla media hora lo arregla.

No las canceles ni las muevas. **Proponelas** con una frase de por qué, y que
decida el usuario. Es su relación con esa gente, no la tuya.

## Paso 5 — Entregá

Primero la semana, día por día, con los bloques ya ubicados en horario.

Después, y esto es obligatorio, **la lista de lo que no entró**, con una línea
por ítem diciendo qué pasa con eso. Sin esta lista el skill no sirve: es la
única parte que obliga a mirar de frente lo que no se va a hacer.

Cerrá con las reuniones que conviene revisar, si hay.

Si el usuario tiene calendario conectado, ofrecé crear los bloques como eventos.
**Preguntá antes de crear nada** y creá solo los bloques de trabajo — nunca
toques ni borres eventos que ya existían.

---

## Reglas

- **La capacidad se calcula antes de mirar los pendientes.** Al revés, el plan
  siempre entra, y siempre miente.
- **Lo que no entra se nombra.** Nunca lo omitas para que el plan se vea mejor.
- **Nunca borres ni muevas eventos existentes.** Proponé, que decida el usuario.
- **El 20% de colchón no se negocia.** Si el usuario lo quiere sacar, decile qué
  se lleva puesto cuando la semana se desborde, y hacelo igual si insiste.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Capacidad primero, pendientes
después. Es lo contrario de lo que hace todo el mundo, y es todo el skill. Si
mirás la lista de tareas antes de contar las horas, vas a acomodar las horas para
que la lista entre — y esa es exactamente la semana que fracasa el miércoles.

**Qué decisión podés copiar en el tuyo.** El Paso 5 obliga a entregar lo que
**no** se va a hacer. Es incómodo y por eso funciona. Cuando armes un skill que
prioriza algo, hacé que el descarte sea parte del entregable, no un residuo que
desaparece.

**Qué pasaría si sacaras esta parte.** Sin el 20% de colchón del Paso 1 el plan
queda técnicamente correcto y prácticamente inútil. El colchón no es pesimismo:
es el reconocimiento de que ninguna semana se parece a su versión planificada, y
un plan sin lugar para lo imprevisto se rompe entero al primer imprevisto.

**Dónde le pusimos el freno.** El skill señala reuniones cuestionables pero no
cancela ninguna. Podría. La razón de no hacerlo no es técnica: cancelar una
reunión es un acto social con consecuencias que el skill no puede ver. Cuando
tu skill toque algo que involucra a otras personas, el default es proponer.
