---
name: escribir-en-mi-voz
description: "Aprende cómo escribe el usuario a partir de textos que ya escribió, guarda un perfil de voz reutilizable, y reescribe cualquier pieza nueva en esa voz en lugar de la voz genérica de la IA. Usar cuando el usuario diga que algo suena a IA, que quiere que suene a él, que quiere reescribir algo con su estilo o su tono, o que las respuestas le salen impersonales."
version: 1.0.0
domain: produce
audience: bootcamp-cc
complexity: standalone
triggers:
  - escribir en mi voz
  - esto suena a IA
  - que suene a mi
  - mi tono
  - reescribir con mi estilo
  - no me representa como esta escrito
  - aprende como escribo
---

# Escribir en mi voz

Saca el perfil de cómo escribe el usuario y lo guarda para que el resto del kit
lo use.

Es la demostración más clara de lo que separa a Claude con contexto propio de
Claude genérico.

## Antes de empezar

Fijate si ya existe `~/.claude/kit-voz.md`. Si está, saltá al Paso 4 y usalo. El
perfil se saca una vez.

---

## Paso 1 — Pedí muestras

Entre tres y cinco textos que el usuario haya escrito **él**, sin ayuda de IA.

Sirven: correos que mandó, mensajes largos de WhatsApp, un posteo, algo que le
escribió a un cliente. Cuanto más parecido al contexto donde va a usar la voz,
mejor.

Dos cosas que hay que decirle:

- Que sean textos **suyos de verdad**. Si le pasa algo que ya escribió con IA, el
  perfil sale con la voz de la IA, y todo el skill se vuelve un espejo vacío.
- Que no elija los mejores. Los textos de todos los días representan mejor la voz
  que el discurso más pulido que escribió una vez.

Con menos de tres, decile que el perfil va a salir flojo y ofrecé hacerlo igual.

## Paso 2 — Analizá lo que se puede imitar

Buscá lo concreto y repetible, no las impresiones:

| Qué mirar | Qué anotar |
|---|---|
| **Largo** | Frases cortas o largas. Párrafos de una línea o de seis. |
| **Arranque** | ¿Entra directo? ¿Saluda? ¿Empieza con una pregunta? |
| **Muletillas** | Las palabras y giros que repite. Son la huella digital. |
| **Puntuación** | ¿Usa guiones? ¿Puntos suspensivos? ¿Signos de exclamación? |
| **Tratamiento** | Vos, tú, usted. Formal o suelto. |
| **Cómo dice que no** | Directo o con rodeo. Es lo que más distingue una voz. |
| **Qué NO hace** | Nunca usa emojis, nunca usa viñetas, nunca abre con "espero que estés bien". |

La última fila es la más importante. Una voz se reconoce tanto por lo que evita
como por lo que hace, y **es lo que la IA pisa primero**: le mete viñetas al que
escribe en prosa y entusiasmo al que es seco.

## Paso 3 — Guardá el perfil

Escribí `~/.claude/kit-voz.md`:

```markdown
# Mi voz

## Cómo escribo
<5-8 líneas concretas: largo, arranque, puntuación, tratamiento>

## Palabras y giros míos
<lista corta de lo que repite de verdad>

## Nunca
<lo que no hace jamás — la lista más útil del archivo>

## Ejemplo
<un fragmento corto de una muestra real, como referencia>
```

Mostráselo y preguntale si se reconoce. Si dice que no, pedile que señale qué
línea no es él y corregí esa. **No rehagas todo**: la corrección puntual es más
precisa que empezar de cero.

## Paso 4 — Reescribí

Con el perfil cargado, tomá el texto que trajo el usuario y reescribilo.

- Cambiá **cómo está dicho**, no qué dice. Si el contenido tiene que cambiar,
  avisalo aparte.
- Si el original tiene marcas de IA, sacalas: apertura entusiasta, viñetas donde
  iba prosa, "es importante destacar", cierres que resumen lo que se acaba de
  decir.
- Respetá la sección **Nunca** por encima de todo lo demás.

Entregá el texto reescrito y, debajo, **tres líneas sobre qué cambiaste y por
qué**. Esa explicación es lo que le va a permitir escribir mejor solo.

## Paso 5 — Contale que quedó guardado

Decile que el perfil se guardó y que `email-dificil`, `triage-correo` y
`reunion-a-acciones` lo van a usar sin que tenga que pedirlo.

Y que si algún día no lo representa, puede volver acá y ajustarlo.

---

## Reglas

- **Nunca inventes rasgos de voz.** Todo lo del perfil sale de las muestras.
- **Nunca cambies el contenido** al reescribir. Solo la forma.
- **La sección Nunca manda.** Si el resto del perfil sugiere algo que contradice
  esa lista, gana la lista.
- **Si las muestras son pocas o parecen escritas con IA, decilo.** Un perfil
  flojo presentado como bueno es peor que no tener perfil.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Muestras → analizar → guardar →
recién ahí reescribir. La tentación es reescribir directo "con el tono del
usuario" a ojo. Sale mal siempre: sin el paso de análisis explícito, lo que se
imita es una impresión general, y las impresiones generales convergen todas al
mismo lugar neutro.

**Qué decisión podés copiar en el tuyo.** La sección **Nunca** del perfil. Definir
algo por sus límites es más preciso que definirlo por sus cualidades: "nunca usa
emojis" es verificable y se obedece, "tono cercano pero profesional" no significa
nada. Cuando tu skill tenga que capturar un estilo o un criterio, pedí la lista
de lo prohibido.

**Qué pasaría si sacaras esta parte.** Sin el Paso 3 — guardar el perfil — este
skill funciona una vez y se olvida. Guardarlo es lo que lo convierte en
infraestructura: otros tres skills del kit lo leen. La diferencia entre una
herramienta y un sistema es si lo que aprende queda escrito en algún lado.

**Por qué pedimos textos comunes y no los mejores.** Es una decisión de método
que se ve chica y no lo es. El texto que alguien pulió durante una hora
representa quién quiere ser cuando escribe; el mensaje que mandó un martes a las
tres de la tarde representa cómo escribe. Vos querés el segundo.
