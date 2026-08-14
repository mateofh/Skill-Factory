---
name: crear-mi-skill
description: "Convierte una tarea repetitiva del usuario en un skill propio: entrevista corta, escribe el SKILL.md, lo guarda en el lugar correcto y lo prueba con el usuario en la misma sesión. Usar cuando el usuario diga que quiere crear o hacer un skill, automatizar algo que hace seguido, convertir una tarea en comando, o cuando se dé cuenta de que le está explicando lo mismo a Claude por tercera vez."
version: 1.0.0
domain: meta
audience: bootcamp-cc
complexity: standalone
triggers:
  - crear mi skill
  - quiero automatizar esto
  - hacer un skill
  - siempre hago lo mismo
  - convertir esto en comando
  - armar un comando propio
  - esto lo repito todo el tiempo
---

# Crear mi skill

Convierte algo que el usuario repite en un skill suyo, funcionando, hoy.

El objetivo no es dejar un archivo escrito. Es que el usuario **vea su skill
andar** antes de terminar la conversación. Si termina con un archivo que no
probó, el skill falló.

## Antes de empezar

Nada.

---

## Paso 1 — Encontrá la tarea

Preguntale qué quiere automatizar. Si no lo tiene claro, ayudalo con estas:

- ¿Qué le pediste a Claude más de una vez esta semana?
- ¿Qué explicás desde cero cada vez que lo pedís?
- ¿Qué tarea hacés siempre igual y siempre te lleva el mismo rato?

**Filtro honesto, y aplicalo de verdad**: no todo merece ser un skill. Si la
tarea se resuelve pidiéndosela a Claude en una frase, no hace falta un skill.
Un skill se justifica cuando hay:

- **un método** — un orden de pasos que importa, o criterios que se olvidan
- **contexto propio** — datos del usuario que habría que repetir siempre
- **un formato fijo** — la salida tiene que verse siempre igual

Si no hay ninguno de los tres, decíselo con franqueza y proponele la frase que
puede usar directamente. **Es mejor resultado que un skill de más.** Un menú
lleno de skills que nadie usa hace que no se encuentren los que sí sirven.

## Paso 2 — La entrevista

Cinco preguntas, de a una:

1. Cuando esto sale perfecto, ¿qué tenés en la mano al final?
2. Contame los pasos como se los explicarías a alguien que arranca mañana.
3. ¿Qué es lo que más se te olvida o más veces sale mal?
4. ¿Qué datos hay que tener a mano antes de empezar?
5. ¿Cómo le vas a pedir esto a Claude? Decime tres formas distintas.

La 3 es la más valiosa: ahí está el método real, lo que distingue el skill de una
instrucción genérica. Si contesta "nada", repreguntá: *"¿y la última vez que
tuviste que rehacerlo?"*.

La 5 sale directo a `triggers` y a `description`.

## Paso 3 — Escribí el skill

Guardalo en `~/.claude/skills/<nombre-en-kebab-case>/SKILL.md`.

```markdown
---
name: nombre-del-skill
description: "Qué hace, y cuándo usarlo. Incluí las palabras que el usuario
  dijo en la pregunta 5 — esto es lo que Claude lee para decidir si te sirve."
---

# Título

<Una línea: qué resuelve.>

## Antes de empezar
<Los datos de la pregunta 4. Si no hace falta nada, escribí "Nada".>

## Paso 1 — ...
## Paso 2 — ...

## Reglas
<Lo de la pregunta 3, en negativo: qué nunca hay que hacer.>
```

Cuatro cosas que definen si funciona o no:

- **El `description` es lo que hace que el skill aparezca.** No describe: dice
  qué hace *y cuándo usarlo*, con las palabras que el usuario usaría de verdad.
  Es el error número uno.
- **Los pasos van en imperativo**, dirigidos a Claude: "Traé", "Clasificá",
  "Preguntá".
- **Las reglas van en negativo.** "Nunca envíes sin confirmar" se obedece mejor
  que "sé cuidadoso".
- **Corto gana.** Un skill de 40 líneas que se usa vale más que uno de 200 que
  intimida.

Mostrale el archivo completo y explicale cada bloque en una línea antes de
guardar.

## Paso 4 — Probalo ahora

Esta parte no es opcional.

Decile que **los skills nuevos aparecen en la próxima conversación**, no en
esta. Para probarlo hoy sin esperar: recorré vos mismo los pasos del skill recién
escrito, con un caso real del usuario, y mostrale el resultado.

Ahí van a aparecer los problemas — siempre aparecen. Falta un paso, sobra otro,
el formato no era el que quería. **Arreglá el archivo en el momento** y volvé a
probar. Dos o tres vueltas es lo normal, no es señal de que salió mal.

Cerrá diciéndole cómo invocarlo (`/nombre-del-skill`) a partir de la próxima
conversación.

## Paso 5 — Dejalo listo para crecer

Una frase final: un skill se termina de escribir usándolo. Cada vez que tenga que
corregir el resultado a mano, esa corrección es una línea nueva en el archivo, y
puede volver acá para agregarla.

---

## Reglas

- **Nunca crees un skill que no se justifica.** Decir "esto no necesita un skill"
  es un resultado válido y muchas veces el correcto.
- **Nunca termines sin probar.** Un archivo sin probar no es un skill, es una
  intención.
- **Mostrá el archivo antes de guardar.** El usuario tiene que poder mantenerlo.
- **Nunca pises un skill que ya existe** con el mismo nombre sin avisar.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Filtrar → entrevistar →
escribir → probar. El filtro va **primero**, antes de la entrevista, y es
deliberado: si entrevistás antes de filtrar, ya invertiste diez minutos y decir
"esto no hacía falta" se vuelve socialmente imposible. El orden protege la
honestidad de la recomendación.

**Qué decisión podés copiar en el tuyo.** El Paso 4. La mayoría de los skills que
generan algo terminan cuando el archivo está escrito. Este termina cuando el
usuario lo vio funcionar. La diferencia entre las dos definiciones de "listo" es
la diferencia entre un entregable y un resultado.

**Qué pasaría si sacaras esta parte.** Sin el filtro del Paso 1, este skill se
convierte en una fábrica de skills que nadie usa. Y el costo no es el archivo de
más: es que cuando tengas veinte, los tres buenos dejan de encontrarse.

**Lo más importante que enseña este archivo.** Mirá la pregunta 3 de la
entrevista — "¿qué es lo que más se te olvida o más veces sale mal?". Esa
pregunta es de donde sale el método. Cualquiera puede escribir los pasos felices
de una tarea; lo que hace valioso a un skill es lo que sabe sobre cómo esa tarea
se rompe. Cuando armes el tuyo, empezá por ahí.
