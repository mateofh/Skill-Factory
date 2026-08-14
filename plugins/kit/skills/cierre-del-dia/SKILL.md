---
name: cierre-del-dia
description: "Cierre de jornada en cinco minutos: qué se hizo de verdad, qué quedó abierto, qué se está evitando, y las tres cosas que arrancan mañana. Deja el registro guardado y las prioridades listas para que las tome armar-semana. Usar cuando el usuario quiera cerrar o repasar el día, cuando pregunte qué hizo hoy o qué deja para mañana, o al terminar la jornada."
version: 1.0.0
domain: thrive
audience: bootcamp-cc
complexity: standalone
triggers:
  - cierre del dia
  - como estuvo mi dia
  - terminar el dia
  - que hice hoy
  - que dejo para mañana
  - repaso del dia
  - cerrar la jornada
---

# Cierre del día

Cinco minutos al final de la jornada. Deja registro de lo que pasó y las tres
cosas que arrancan mañana.

Si tarda más de cinco minutos, el usuario lo abandona en una semana. Cuidá el
reloj como si fuera un requisito, porque lo es.

## Antes de empezar

Nada. Si hay `~/.claude/kit-config.md`, usá el nombre del usuario.

---

## Paso 1 — Qué pasó

Preguntá abierto: *"¿Cómo fue el día?"*. Dejalo contar sin estructura.

Si tenés correo o calendario conectado, mirá qué reuniones hubo hoy y usalo para
repreguntar por lo que no mencionó: *"vi que tuviste la reunión con X, ¿en qué
quedó?"*. No listes su día — preguntá por los huecos.

Sin nada conectado, alcanza con lo que cuente.

## Paso 2 — Separá lo hecho de lo avanzado

Dos columnas, y la diferencia importa:

- **Terminado** — está cerrado, no vuelve.
- **Avanzado** — se movió, sigue abierto, tiene un próximo paso concreto.

Casi todo el mundo subestima su día porque cuenta solo lo terminado. Mostrarle lo
avanzado es la mitad del valor de este skill, sobre todo los días que se sintieron
improductivos.

## Paso 3 — La pregunta incómoda

Una sola, y va siempre:

> **¿Qué estuviste evitando hoy?**

Es la que ningún resumen automático hace y la que más rinde. Reglas:

- Preguntala derecho, sin suavizarla con tres cláusulas de disculpa.
- Si contesta "nada", aceptalo y seguí. No insistas. Insistir la convierte en un
  interrogatorio y el usuario deja de usar el skill.
- Si contesta algo, **no lo resuelvas ahora**. Anotalo y preguntá una sola cosa:
  *"¿qué sería el paso más chico posible para destrabarlo?"*.
- **Nunca lo juzgues.** Ni "deberías", ni "es importante que". Se anota y punto.

Lo evitado se acumula entre días. Si aparece lo mismo tres días seguidos,
decíselo — sin bajada de línea, solo el dato: *"esto viene apareciendo desde el
lunes"*.

## Paso 4 — Tres cosas para mañana

Tres. No cinco, no "las que salgan".

Salen, en este orden de prioridad:
1. Lo que quedó a medias y tiene el próximo paso claro.
2. Lo que tiene fecha encima.
3. El paso chico de lo que se está evitando.

Si el usuario propone más de tres, hacelo elegir. La elección es el trabajo.

## Paso 5 — Guardá y cerrá

Agregá al final de `~/.claude/kit-diario.md` (creá el archivo si no existe):

```markdown
## <fecha>

**Terminado:** ...
**Avanzado:** ...
**Evitando:** ...
**Mañana:** 1. ... 2. ... 3. ...
```

Ese archivo lo leen `armar-semana` y el próximo `cierre-del-dia`.

Cerrá con dos o tres líneas sobre cómo fue el día, en tono humano. Sin
felicitaciones vacías: si el día fue malo, decilo sin dramatizar. Si rindió,
decilo sin exagerar. El usuario sabe cómo fue su día — un cierre que le miente
pierde credibilidad para siempre.

---

## Reglas

- **Cinco minutos.** Si se estira, cortá y guardá lo que haya.
- **Nunca juzgues lo evitado.** Se anota, no se sermonea.
- **Tres cosas para mañana, techo duro.**
- **Nunca inventes actividad** que el usuario no mencionó ni figura en su
  calendario.
- **Nada de entusiasmo impostado.** Un día malo se nombra como lo que fue.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Contar → separar → la pregunta
incómoda → priorizar. La pregunta por lo evitado va en el medio, no al final, a
propósito: si va al final, queda como un reproche de despedida. En el medio, lo
que se evita alimenta las tres cosas de mañana y se convierte en algo con salida.

**Qué decisión podés copiar en el tuyo.** La separación entre "terminado" y
"avanzado" del Paso 2. Es un cambio de categorías chiquito que cambia cómo se
siente el resultado. Cuando tu skill mida algo, revisá si las categorías que
usás no están escondiendo la mitad del trabajo real.

**Qué pasaría si sacaras esta parte.** Sin el Paso 3, este es un registro de
actividad — hay veinte apps que hacen eso y nadie las usa a los dos meses. Lo que
lo sostiene en el tiempo es que hace una pregunta que uno no se hace solo.

**Por qué prohibimos el juicio.** No es corrección política: es diseño. Un skill
que te señala con el dedo por lo que evitaste es un skill que empezás a
contestar con lo que queda bien en vez de con la verdad, y desde ese día no
sirve más. Cuando tu skill le pida a alguien información incómoda, el precio de
recibirla es no usarla en su contra.
