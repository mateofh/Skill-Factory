# Kit de productividad

Once herramientas para usar Claude Code en el trabajo de todos los días: correo,
agenda, reuniones, escritura, y para armarte las tuyas.

## Instalarlo

Dos comandos, una sola vez. Escribilos dentro de Claude Code:

```
/plugin marketplace add https://github.com/mateofh/Skill-Factory.git
/plugin install kit@bootcamp-cc
```

Si al terminar te dice que corras `/reload-plugins`, hacelo. Listo.

> Copiá la dirección completa tal cual, con el `https://` y el `.git` al final.
> La versión corta `mateofh/Skill-Factory` también existe, pero solo funciona si
> ya configuraste llaves de acceso a GitHub — y si no sabés si las tenés, no las
> tenés.

Para actualizarlo más adelante, cuando se agreguen mejoras:

```
/plugin marketplace update
```

## Por dónde empezar

En este orden. Son diez minutos en total y cambian todo lo demás.

```
/kit:configurar-mi-kit     Deja el kit listo y detecta qué tenés conectado
/kit:mi-claude-md          Le enseña a Claude quién sos y cómo querés que te hable
```

El segundo es el que más rinde de los once. Si vas a hacer uno solo, hacé ese.

## Los once

**Para arrancar**

| | |
|---|---|
| `/kit:configurar-mi-kit` | Prepara el kit y detecta tu correo y calendario |
| `/kit:mi-claude-md` | Escribe tus instrucciones para que Claude te conozca |
| `/kit:crear-mi-skill` | Convierte algo que repetís en una herramienta tuya |
| `/kit:auditar-mi-setup` | Revisa qué tenés mal configurado y lo arregla |

**Tu día**

| | |
|---|---|
| `/kit:triage-correo` | Ordena la bandeja por lo que se rompe si esperás |
| `/kit:armar-semana` | Arma la semana con las horas que hay de verdad |
| `/kit:preparar-reunion` | El brief de una carilla antes de entrar |
| `/kit:reunion-a-acciones` | De la reunión a quién hace qué, y el correo de seguimiento |
| `/kit:cierre-del-dia` | Cinco minutos para cerrar la jornada |

**Escribir**

| | |
|---|---|
| `/kit:email-dificil` | El correo que venís postergando |
| `/kit:escribir-en-mi-voz` | Aprende cómo escribís y deja de sonar a IA |

No hace falta escribir el nombre completo. Si decís *"tengo el mail explotado"* o
*"¿qué hice hoy?"*, Claude elige el que corresponde.

## Correo y calendario

Cuatro de los once pueden leer tu correo o tu agenda. **Funcionan igual con
Google que con Microsoft**, y también sin nada conectado — en ese caso te van
pidiendo lo que necesitan.

Conectar la cuenta se hace desde la configuración de Claude en el navegador, no
desde acá. `/kit:configurar-mi-kit` te dice los pasos exactos según lo que uses.

## Lo que ninguno hace

Ninguno manda un correo, borra un mensaje, cancela una reunión ni publica nada.
Preparan, proponen y escriben borradores. El botón de mandar lo apretás vos,
siempre.

## Si algo no anda

```
/kit:auditar-mi-setup
```

Revisa cómo quedó todo y te dice qué arreglar, en castellano.

## Para tocarlos

Cada uno termina con una sección **"Cómo está hecho este skill"** que explica por
qué está escrito así y qué podés copiar para los tuyos. Está pensada para leerse
sin saber programar.

Cuando quieras hacerte uno propio: `/kit:crear-mi-skill`.
