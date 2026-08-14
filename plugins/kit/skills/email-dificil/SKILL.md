---
name: email-dificil
description: "Escribe el correo que el usuario viene postergando: dar una mala noticia, reclamar un pago, decir que no, corregir a alguien, reabrir algo que salió mal. Entrega dos o tres versiones con distinto nivel de dureza y explica qué esperar de cada una. No necesita ninguna conexión y nunca envía. Usar cuando el usuario diga que tiene que escribir algo incómodo, que no sabe cómo decir algo, que tiene que decir que no, reclamar, o dar una mala noticia."
version: 1.0.0
domain: negotiate
audience: bootcamp-cc
complexity: standalone
triggers:
  - email dificil
  - tengo que decir que no
  - como le digo que
  - reclamar un pago
  - mala noticia por mail
  - correo incomodo
  - no se como escribir esto
---

# El correo difícil

El que está en borradores hace cuatro días.

Casi nunca es un problema de redacción. Es que todavía no está decidido qué se
quiere que pase. Por eso este skill pregunta antes de escribir.

## Antes de empezar

Nada. Si existe `~/.claude/kit-voz.md`, usalo para el tono.

---

## Paso 1 — Qué pasó, sin adjetivos

Pedile al usuario que cuente la situación. Después devolvésela separada en dos:

- **Los hechos** — lo que pasó, verificable, sin interpretación.
- **Lo que él concluye** — su lectura de por qué.

Mostrale la separación. Es útil por sí sola: buena parte de lo que hace difícil
un correo difícil es que estamos por mandar una interpretación escrita como si
fuera un hecho.

Solo los hechos van al correo. Las conclusiones se usan para decidir el tono.

## Paso 2 — Qué querés que pase

Dos preguntas, las dos hacen falta:

1. **¿Qué querés que la otra persona haga** después de leerlo?
2. **¿Cómo querés que quede la relación** después de esto?

La segunda es la que decide todo. "Que me pague y no lo vuelvo a ver" y "que me
pague y sigamos trabajando" son dos correos completamente distintos, y el
usuario muchas veces no lo pensó.

Si contesta que no sabe, ofrecele los dos caminos y que elija. No sigas sin
respuesta: sin esto vas a escribir un correo tibio, que es el único tipo de
correo difícil que garantiza no funcionar.

## Paso 3 — Qué estás temiendo

Una pregunta más: *"¿qué es lo peor que puede pasar si mandás esto?"*.

El miedo concreto es lo que estuvo dictando las cuatro versiones que ya borró.
Nombrado, deja de dictar. Y a veces revela que el correo no es el canal — si lo
peor que puede pasar es perder un cliente de años, capaz es una llamada. **Decilo
si es el caso**, aunque el usuario haya pedido un correo.

## Paso 4 — Escribí dos o tres versiones

Todas comparten el mismo esqueleto:

1. **El punto, arriba.** En las primeras dos líneas. Sin rodeo de cortesía.
2. **Los hechos**, breves, sin adjetivos.
3. **Qué proponés** — un camino concreto hacia adelante.
4. **Qué necesitás de la otra parte**, con fecha si corresponde.

Las versiones cambian en dureza, no en estructura:

| Versión | Cuándo sirve |
|---|---|
| **Directa** | Relación sana, historia buena. Corta, sin envoltorio. |
| **Firme** | Ya hubo idas y vueltas. Deja constancia sin cerrar la puerta. |
| **Última** | Se acabó la paciencia. Nombra la consecuencia concreta. |

Cuatro cosas que hacen la diferencia, y que hay que respetar en las tres:

- **Nunca sándwich.** Elogio-problema-elogio se lee como cobardía y diluye el
  mensaje justo donde tiene que ser claro.
- **No te disculpes por lo que no lamentás.** "Perdón por insistir" invita a que
  te sigan haciendo esperar.
- **Sin condicional de miedo.** "Habría querido consultarte si sería posible" es
  cuatro capas de acolchado sobre una pregunta simple.
- **Más corto es más amable.** Un correo largo obliga al otro a buscar la mala
  noticia. Encontrarla rápido duele menos.

## Paso 5 — Entregá con el pronóstico

Cada versión con dos líneas debajo: **cuándo usarla** y **qué respuesta esperar**.
Ese pronóstico es lo que permite elegir, y es lo que el usuario no puede ver solo
porque está adentro de la situación.

Cerrá con una recomendación de cuál mandarías vos y por qué. Una frase.

**Nunca envíes.** Ni ofrezcas enviarlo. Este correo lo aprieta la persona que se
va a bancar la respuesta.

---

## Reglas

- **Nunca enviar.** Sin excepciones, aunque el usuario lo pida.
- **Nunca inventar hechos.** Si falta un dato, va entre corchetes para que lo
  complete.
- **Nunca escribir sin la respuesta del Paso 2.** Sin objetivo no hay correo, hay
  desahogo.
- **Decir si el correo no es el canal.** Aunque no te lo hayan preguntado.
- **Nada de amenazas ni de sarcasmo**, ni siquiera en la versión más dura. Firme
  no es agresivo.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Hechos → objetivo → miedo →
recién ahí escribir. Tres pasos antes de tocar una palabra del correo. Parece
mucho para un mail, y es justamente el punto: el correo está trabado hace cuatro
días porque nunca se contestaron esas tres preguntas. Escribir era la parte
fácil.

**Qué decisión podés copiar en el tuyo.** El Paso 1 separa hechos de
interpretación y solo deja pasar los hechos al entregable. Es un filtro simple
que sirve en cualquier skill que produzca algo que otra persona va a leer.

**Qué pasaría si sacaras esta parte.** Sin las versiones múltiples del Paso 4, el
usuario recibe *una* respuesta y no aprende nada sobre el rango. Con tres y su
pronóstico, entiende qué mueve el dial — y la próxima vez escribe mejor solo. Un
skill que enseña mientras resuelve vale el doble.

**Dónde le pusimos el freno, y por qué acá es innegociable.** No envía, y ni
siquiera lo ofrece. Es el skill donde la tentación de automatizar el último paso
es más fuerte y donde el costo de equivocarse es más alto: un correo difícil mal
enviado no se puede deshacer, y arruina relaciones que tardaron años. Cuando
diseñes un skill, preguntate cuál es la acción irreversible — y sacala de tus
manos.
