---
name: preparar-reunion
description: "Arma el brief previo a una reunión: quién es la persona, qué se habló las veces anteriores, qué quedó pendiente de cada lado y qué conviene pedir o cerrar en esta. Cruza calendario y correo, en Google o en Microsoft 365, o funciona a mano. Usar cuando el usuario diga que tiene una reunión o llamada próxima, que quiere prepararla, que no se acuerda quién es alguien o qué hablaron la vez pasada."
version: 1.0.0
domain: operate
audience: bootcamp-cc
complexity: standalone
triggers:
  - preparar la reunion
  - tengo call en una hora
  - quien es esta persona
  - brief de reunion
  - que hablamos la vez pasada
  - con quien me reuno hoy
  - preparame la llamada
---

# Preparar la reunión

Una carilla, leída en dos minutos antes de entrar, que evita la peor apertura
posible: *"perdón, ¿en qué habíamos quedado?"*.

## Antes de empezar

Leé `~/.claude/kit-config.md` para saber qué hay conectado. Sin archivo, modo
manual.

---

## Paso 1 — Identificá la reunión

- **Con calendario conectado**: traé la próxima reunión, o la que el usuario
  indique. Sacá título, horario, participantes y descripción.
- **Sin nada conectado**: pedile que pegue la invitación, o que te diga con quién
  se reúne y sobre qué.

Si hay varias candidatas en las próximas horas, mostrale las opciones y que
elija. No adivines.

## Paso 2 — Reconstruí la historia

Buscá en el correo los intercambios con esos participantes. Traé lo de los
**últimos 90 días**, y priorizá lo más reciente.

Lo que buscás, en este orden:

1. **Qué se acordó la última vez.** Compromisos concretos, con quién los tomó.
2. **Qué quedó abierto.** Preguntas sin responder, decisiones postergadas.
3. **Qué cambió desde entonces.** Algo que se movió y la otra parte todavía no
   sabe, o al revés.
4. **El tono.** Si la última conversación fue tensa, eso importa más que el
   contenido.

Sin correo conectado, preguntale al usuario los puntos 1 y 2 directamente. Dos
preguntas, no un interrogatorio.

## Paso 3 — Separá compromisos de conversación

Este es el paso que hace la diferencia. De todo lo que juntaste, distinguí:

- **Lo que alguien se comprometió a hacer** — y si lo hizo o no.
- **Lo que solo se habló** — sin dueño, sin fecha.

Los pendientes del usuario van marcados aparte y primero. Entrar a una reunión
sin saber qué debés vos es la forma más rápida de perder pie en los primeros
cinco minutos.

Si alguien prometió algo y no aparece cumplido en ningún lado, marcalo como
**sin confirmar** — no como incumplido. Puede haberse resuelto por un canal que
no ves.

## Paso 4 — Definí qué se busca

Preguntale al usuario **qué quiere que pase** al terminar la reunión, si no está
claro por el contexto. Una sola pregunta.

Con eso, proponé hasta **tres** puntos a cubrir. Para cada uno:

- Qué se plantea.
- Qué resultado se busca.
- Qué hacer si la otra parte dice que no.

Tres es el techo. Una reunión con siete puntos no tiene puntos, tiene una
esperanza.

## Paso 5 — Entregá el brief

Una carilla, en este orden:

```
CON QUIÉN     Nombre, rol, y de qué los conocés — 1 línea
CUÁNDO        Día, hora, duración
DÓNDE VAMOS   La historia en 3 líneas, no más
TU DEBE       Lo que vos te comprometiste y no hiciste (si hay)
SU DEBE       Lo que ellos se comprometieron (marcado sin confirmar si no consta)
LOS 3 PUNTOS  Qué plantear, qué buscás, qué hacer si no
OJO CON       Una línea de contexto delicado, solo si existe
```

Si no hay historia previa — es la primera vez — decilo derecho y armá el brief
con lo que haya. No rellenes con generalidades.

---

## Reglas

- **Nunca inventes historia.** Si no encontraste intercambios previos, decilo. Un
  brief con contexto inventado es peor que no tener brief: entrás confiado y
  equivocado.
- **Marcá lo no confirmado como no confirmado.** Nunca acuses de incumplimiento
  por ausencia de evidencia.
- **Tres puntos, techo duro.**
- **Solo lectura.** Este skill no responde correos ni modifica la reunión.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Identificar → reconstruir →
separar → decidir qué se busca. El orden importa porque el Paso 4 (qué querés
lograr) solo se puede contestar bien **después** de saber dónde quedó la cosa. Al
revés, el objetivo sale de la ansiedad del momento en vez de la historia real.

**Qué decisión podés copiar en el tuyo.** El Paso 3 separa *compromisos* de
*conversación*. Es una distinción chica que cambia todo el entregable: la mayoría
de los resúmenes de reunión mezclan lo que alguien dijo con lo que alguien se
comprometió a hacer, y eso convierte la memoria en niebla. Cuando tu skill
procese una conversación, hacé esa separación explícita.

**Qué pasaría si sacaras esta parte.** Sin el "TU DEBE" del entregable, el brief
te prepara para reclamar y no para responder. Es la mitad más incómoda y la que
más te salva.

**Por qué el techo de tres.** No es una restricción de formato. Un skill que te
deja poner siete puntos te deja entrar a la reunión sin haber priorizado, y
priorizar era justamente el trabajo. Los límites duros de un skill son
decisiones de método disfrazadas de decisiones de formato — usalos a propósito.
