---
name: armar-prd
description: >-
  Arma el PRD de un producto (landing, app, herramienta) o de una automatización en cuatro
  documentos, uno por vez y con confirmación entre cada uno, listo para que Claude Code lo
  construya por fases. USA cuando: "armame un PRD", "quiero construir una landing", "quiero hacer
  una app", "quiero automatizar este proceso", "especificación para Claude Code", "plan para
  construir esto". Es para algo que se va a construir: crear-mi-skill convierte una tarea que el
  usuario le pide a Claude en un skill, y process-decode documenta un proceso de varias personas
  antes de decidir qué automatizar.
metadata:
  label:
    es: Armar un PRD
    en: Build a PRD
  summary:
    es: Convierte tu idea de producto o automatización en cuatro documentos claros y en fases listas para pegarle a Claude Code, sin inventar colores ni cifras.
    en: Turns your product or automation idea into four clear documents and build phases ready to paste into Claude Code, without inventing colors or numbers.
  version: 1.0.0
  domain: operate
  audience: shared
  harnesses: [claude]
  tags: [productividad]
  complexity: standalone
  triggers:
    - armame un prd
    - armar un prd
    - quiero construir una landing
    - quiero hacer una app
    - quiero automatizar este proceso
    - especificacion para claude code
    - plan para construir esto
---

# Armar un PRD

Convierte una idea —un producto o una automatización— en el documento que hace falta para
construirla bien a la primera.

PRD quiere decir *documento de requerimientos de producto*: qué se construye, para quién, cómo
se ve, en qué orden y cómo se sabe que quedó bien. El usuario termina con cuatro archivos en una
carpeta y una lista de fases que le puede pegar a Claude Code de a una.

## Cuándo usar

- Explícito: "armame un PRD", "quiero construir una landing", "quiero hacer una app", "quiero
  automatizar este proceso", "especificación para Claude Code", "plan para construir esto".
- Implícito: el usuario está por pedirle a Claude Code que construya algo de más de una pantalla
  o de más de un paso, y todavía no escribió qué es exactamente.
- Cadencia: una vez por proyecto, antes de escribir la primera línea de código.

## Cuándo NO usar

- **`crear-mi-skill`** — cuando lo que quiere automatizar es una tarea que le pide a Claude
  (resumir, redactar, ordenar). Eso es un skill, no un producto.
- **`process-decode`** — cuando el proceso todavía no está claro: varias personas, pasos que nadie
  escribió. Primero se entiende el proceso, después se arma el PRD.
- Un cambio chico a algo que ya existe ("cambiá el color del botón"). Se le pide directo.

## Input del usuario

| Campo | De dónde sale | Si falta, preguntar |
|---|---|---|
| La idea (brief) | El usuario | *"Contame qué querés construir, como se lo contarías a un amigo."* |
| Rama | Paso 0 | *"¿Es algo que la gente usa (una página, una app) o algo que corre solo (una automatización)?"* |
| Datos de la rama | Paso 0, lista en `references/producto.md` o `references/automatizacion.md` | Solo los que el brief no trae, de a dos o tres |
| Colores (producto) | El usuario | *"¿Tenés colores de marca? Si no, ¿qué sensación buscás: confianza, energía, calidez…?"* |
| Dónde guardar | Carpeta actual | *"Lo guardo en `prd/<nombre>/` dentro de esta carpeta. ¿Te sirve?"* |

No necesita ninguna conexión.

## Workflow

Antes de cada documento, leé la plantilla de su rama en `references/` y el stack sugerido en
`references/stack-por-defecto.md`. La plantilla dice qué secciones van; este archivo dice cómo
se conversa.

---

## Paso 0 — Entender, preguntar, resumir

**0.1 — Elegí la rama.** Si el brief no lo deja claro, preguntalo primero: *producto* (landing,
app, herramienta que alguien abre y usa) o *automatización* (algo que arranca solo con un
disparador y mueve datos entre sistemas). La rama decide los cuatro documentos.

**0.2 — Extraé lo que ya está.** Leé el brief y marcá qué datos de la lista de la rama ya tenés.
No vuelvas a preguntar lo que el usuario ya dijo: es lo que más rápido hace abandonar.

**0.3 — Preguntá lo que falta**, de a dos o tres por mensaje, nunca la lista entera de golpe.

**0.4 — Resumí en exactamente cuatro bullets:**

- Producto: **Objetivo** · **Sensación / tono** · **Cómo convierte** (acción principal, qué
  datos pide, cuánta fricción) · **Estructura** (secciones o pantallas principales).
- Automatización: **Objetivo** · **Disparador → resultado** · **Sistemas que toca** · **Qué no
  puede fallar**.

Cerrá con: *"Contestame lo que falte y dame un 👍 si el resumen está bien. Arranco con el
primero: `masterplan.md`."* No avances sin ese 👍.

## Pasos 1 a 4 — Un documento por vez

| # | Producto | Automatización |
|---|---|---|
| 1 | `masterplan.md` | `masterplan.md` |
| 2 | `implementation-plan.md` | `implementation-plan.md` |
| 3 | `design-guidelines.md` | `integraciones-y-datos.md` |
| 4 | `app-flow.md` | `runbook-y-fallos.md` |

Para cada uno:

1. Escribilo siguiendo la plantilla de la rama, con datos concretos: hex, px, ms, cantidades,
   nombres de campos. Nada de "un color llamativo" ni "un tiempo razonable".
2. Guardalo en `prd/<nombre>/` y mostrale al usuario un resumen de cinco líneas, no el archivo
   entero: lo puede abrir él.
3. Preguntá: *"¿Avanzo al 2/4: `implementation-plan.md`?"* (con el número y nombre que
   corresponda). Si pide cambios, corregí ese documento antes de seguir.

**El `implementation-plan.md` es para Claude Code, no para un equipo.** Cada fase es un bloque
que el usuario copia y pega en Claude Code tal cual: qué construir, qué documentos del PRD leer,
y un *"listo cuando…"* que el usuario puede comprobar sin saber programar ("abro la página en el
celular y veo el formulario sin bajar", "me llega el correo de prueba"). La Fase 0 es siempre la
misma: *"Leé los cuatro documentos de `prd/<nombre>/` y contame en cinco líneas qué vas a
construir antes de escribir código."*

## Paso 5 — Cerrar

Cuando el cuarto documento está aprobado:

*"PRD completo. Para construirlo, abrí Claude Code en esta carpeta y pegá la Fase 0 de
`implementation-plan.md`. Después, una fase por vez: no pases a la siguiente hasta que el 'listo
cuando…' se cumpla. ¿Querés ajustar algo de alguno de los cuatro?"*

---

## Reglas duras

- **Nunca generes el siguiente documento sin confirmación.** Un documento por mensaje.
- **Nunca inventes colores.** Preguntá → proponé → confirmá → usá. Si dio dos o tres colores,
  completá los que faltan y mostralos como propuesta, no como hecho.
- **Nunca inventes cifras.** Ni conversión, ni horas ahorradas, ni plata. Si el usuario no dio el
  dato, se escribe "a medir" y se dice cómo medirlo.
- **Nunca asumas una plataforma paga** (Lovable, Bubble, Zapier pago…) sin preguntar. El stack
  sugerido es un default, no una decisión tomada.
- **Nunca dejes jerga sin traducir.** Si el documento dice "Supabase", en la misma línea dice qué
  es: "la base de datos donde quedan los registros".
- **Nunca escribas una fase que el usuario no pueda comprobar.** Si el "listo cuando…" necesita
  leer código, está mal escrito.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Resumen → aprobación → un documento por vez.
El resumen de cuatro bullets va antes que nada porque es barato de corregir: un malentendido
arreglado ahí cuesta una línea; arreglado en el documento 3 cuesta rehacer tres archivos.

**Qué decisión podés copiar en el tuyo.** La regla de los colores: preguntar, proponer,
confirmar, usar. Sirve para cualquier dato que la IA tiende a rellenar sola —precios, nombres,
fechas—. Si el skill no lo prohíbe, lo inventa, y lo inventa con total seguridad.

**Qué pasaría si sacaras esta parte.** Sin la confirmación entre documentos, te llegan cuatro
archivos de golpe, construidos sobre una idea que el primero ya tenía mal. Los leés por encima,
los aprobás, y el error aparece cuando Claude Code ya construyó media app.

**Lo más importante que enseña este archivo.** El "listo cuando…" de cada fase. Un plan que no
dice cómo se comprueba que algo quedó bien no es un plan, es una lista de deseos. Cuando le
pidas algo grande a Claude Code, decile siempre cómo vas a saber que terminó.

## Output esperado

Una carpeta `prd/<nombre>/` con cuatro archivos Markdown, aprobados de a uno:

- **Producto:** `masterplan.md`, `implementation-plan.md`, `design-guidelines.md`, `app-flow.md`.
- **Automatización:** `masterplan.md`, `implementation-plan.md`, `integraciones-y-datos.md`,
  `runbook-y-fallos.md`.

El `implementation-plan.md` termina en fases numeradas, cada una lista para pegar en Claude Code
con su "listo cuando…" comprobable. Ningún color, cifra o plataforma que el usuario no haya dado
o aprobado.

## Skills relacionados

- **Antes:** `process-decode` si la automatización es de un proceso que nadie escribió todavía.
- **En vez de este:** `crear-mi-skill` cuando lo que se quiere automatizar es una tarea que se le
  pide a Claude, no un sistema que corre solo.
