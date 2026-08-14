---
name: triage-correo
description: "Recorre la bandeja de entrada, clasifica cada mensaje por la acción que exige, lo ordena por el costo de no atenderlo, y deja borradores listos para los que se responden solos. Funciona con Gmail, con Microsoft 365, o a mano si el usuario no tiene nada conectado. Usar cuando el usuario diga que quiere hacer triage, revisar o poner en orden su bandeja, saber qué correos son urgentes, o que tiene el mail desbordado."
version: 1.0.0
domain: operate
audience: bootcamp-cc
complexity: standalone
triggers:
  - triage de correo
  - revisa mi bandeja
  - que correos son urgentes
  - ordenar el mail
  - tengo el mail explotado
  - poner al dia el correo
  - que tengo que responder
---

# Triage de correo

Convierte una bandeja desbordada en una lista corta de decisiones, ordenada por
lo que pasa si no la atendés.

La bandeja no se ordena por fecha ni por remitente. Se ordena por **qué se rompe
si esto espera**.

## Antes de empezar

Leé `~/.claude/kit-config.md` para saber qué proveedor usa el usuario. Si el
archivo no existe, asumí que no hay nada conectado y andá directo al modo manual
(abajo). No corras `configurar-mi-kit` por tu cuenta — ofrecelo, si hace falta.

---

## Paso 1 — Traé los mensajes

Pedí los mensajes **no leídos de las últimas 72 horas**, hasta 40.

Los tres caminos dan el mismo resultado:

- **Con correo conectado** (Gmail o Microsoft 365, da igual cuál): usá las
  herramientas de correo que tengas disponibles. Pedí remitente, asunto, fecha y
  el cuerpo o su resumen. No pidas adjuntos ni el hilo completo todavía.
- **Sin nada conectado**: pedile al usuario que copie y pegue lo que ve en su
  bandeja. Con remitente y asunto alcanza para clasificar; el cuerpo hace falta
  solo para los que terminen en borrador.

Si hay más de 40, decilo y trabajá con los 40 más recientes. Nunca recortes en
silencio.

Si no hay nada sin leer, decilo y ofrecé mirar los últimos 7 días.

## Paso 2 — Clasificá por acción requerida

Cada mensaje entra en **una** categoría. La pregunta es siempre la misma: *¿qué
tiene que hacer esta persona con esto?*

| Categoría | Qué significa |
|---|---|
| **Responder** | Necesita el criterio del usuario. Nadie más puede contestarlo. |
| **Decidir** | Le piden aprobar, elegir o autorizar algo. |
| **Hacer** | Hay una tarea concreta que no es escribir una respuesta. |
| **Delegar** | Otra persona puede resolverlo. |
| **Leer** | Informativo. Importa saberlo, no hay que hacer nada. |
| **Ruido** | Promoción, notificación automática, copia de cortesía. |

No clasifiques por quién manda ni por qué carpeta cayó. Un correo del jefe puede
ser Ruido y una notificación automática puede ser Decidir.

## Paso 3 — Ordená por costo de esperar

Dentro de lo accionable (Responder, Decidir, Hacer, Delegar), ordená por lo que
se rompe si no se atiende hoy. En orden:

1. **Hay alguien bloqueado esperando.** No puede avanzar sin esta respuesta.
2. **Hay una fecha que vence.** Y la fecha está cerca.
3. **Se está enfriando.** Ya lleva días esperando y el silencio empieza a
   significar algo.
4. **Cuesta plata o relación.** Un cobro, un cliente molesto, una propuesta viva.
5. **El resto.**

Marcá explícitamente los que llevan **más de 3 días sin respuesta**. Esos son los
que generan el daño invisible: nadie los reclama y cada día pesan más.

## Paso 4 — Escribí los borradores que se justifican

Solo para los de **Responder**, y solo cuando ya sabés qué se contesta.

- Si el usuario tiene perfil de voz en `~/.claude/kit-voz.md`, usalo.
- Si no, escribí neutro y claro, y mencionale al final que con
  `escribir-en-mi-voz` los próximos salen con su tono.
- Si te falta un dato que solo el usuario tiene, **no lo inventes**: dejá el
  borrador con el hueco marcado entre corchetes.

**Nunca envíes nada.** Dejá el borrador guardado y decílo. Si el usuario quiere
mandar, que lo haga él.

Sin correo conectado no hay dónde guardar: mostrale el texto para que copie.

## Paso 5 — Entregá

Primero la lista accionable, una línea por mensaje:

```
1. [Responder] Marina – presupuesto revisado
   Está frenada esperando tu OK desde el martes. Borrador listo.
2. [Decidir] Contaduría – ¿facturamos agosto por adelantado?
   Vence mañana. Necesita un sí o un no.
```

Después, en dos líneas: cuántos quedaron en Leer y cuántos en Ruido. Sin
detallarlos — si los detallás, la lista deja de ser corta y el skill pierde el
sentido.

Cerrá con **una** frase sobre lo que más conviene atender primero y por qué.

---

## Reglas

- **Nunca enviar, archivar ni borrar.** Solo leer y dejar borradores. Cualquier
  acción que modifique la bandeja se propone, no se ejecuta.
- **Nunca inventar contenido de un correo.** Si no lo leíste, no lo resumas.
- **El mismo entregable en las tres ramas.** Lo único que cambia es de dónde
  salen los datos.
- **Si recortás, avisá.** Un límite silencioso se lee como "ya está todo".

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Traer → clasificar → ordenar →
redactar. La clasificación va antes que el orden a propósito: si mezclás las dos
preguntas, terminás ordenando por urgencia percibida, que es casi siempre quién
gritó más fuerte. Separarlas obliga a preguntar primero *qué es* y recién después
*qué tan caro es ignorarlo*.

**Qué decisión podés copiar en el tuyo.** La taxonomía del Paso 2 está armada por
**acción requerida**, no por tema ni por remitente. Es la diferencia entre una
categoría que te dice qué hacer y una etiqueta que solo te dice de qué se trata.
Cuando armes categorías para lo tuyo, probá que cada una termine en un verbo.

**Qué pasaría si sacaras esta parte.** Si sacás el Paso 3, tenés una bandeja
clasificada — que es exactamente igual de abrumadora que una sin clasificar, solo
que en colores. El valor no está en agrupar, está en decir qué va primero.

**El límite que le pusimos a propósito.** Este skill nunca manda un correo. No es
una limitación técnica: puede hacerlo. Es una decisión. Un skill que escribe en
nombre tuyo y además aprieta enviar es un skill que te vas a arrepentir de haber
instalado el día que se equivoque. Cuando armes los tuyos, elegí conscientemente
dónde ponés el freno.
