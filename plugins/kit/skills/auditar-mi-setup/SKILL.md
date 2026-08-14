---
name: auditar-mi-setup
description: "Revisa cómo quedó configurado el Claude Code del usuario — instrucciones globales, skills instalados, conectores, kit — detecta lo que está mal o vacío y lo arregla o explica cómo arreglarlo. Usar cuando el usuario pregunte si está bien configurado, por qué algo no le funciona, cuando pida un diagnóstico o revisión de su setup, o cuando un skill no aparezca o no se dispare."
version: 1.0.0
domain: meta
audience: bootcamp-cc
complexity: standalone
triggers:
  - auditar mi setup
  - esta bien configurado
  - por que no me funciona
  - revisa mi claude code
  - diagnostico
  - no me aparece el skill
  - que tengo mal
---

# Auditar mi setup

Diagnóstico corto de cómo quedó el Claude Code del usuario, con los arreglos
seguros ya aplicados y los riesgosos explicados.

Está pensado para contestar solo la pregunta que el usuario iba a hacer por
mensaje después de clase.

## Antes de empezar

Nada.

---

## Paso 1 — Revisá, sin tocar nada todavía

Mirá estos cinco puntos. Anotá lo que encontrás, no arregles todavía.

**1. Instrucciones globales** — `~/.claude/CLAUDE.md`
- ¿Existe? ¿Tiene contenido real, o quedó el ejemplo?
- ¿Hay líneas que no cambian ningún comportamiento? ("sé profesional")
- ¿Hay reglas que se contradicen entre sí?

**2. Skills** — `~/.claude/skills/` y los plugins instalados
- ¿Cuántos hay?
- ¿Alguno sin `description`, o con uno que no dice *cuándo* usarlo? Es la causa
  número uno de "instalé el skill y no aparece".
- ¿Dos skills con el mismo nombre o con descripciones casi iguales? Compiten
  entre sí y gana cualquiera.

**3. Conectores** — correo y calendario
- ¿Qué hay conectado?
- ¿Coincide con lo anotado en `~/.claude/kit-config.md`?
- Si el archivo dice una cosa y la realidad dice otra, el archivo está viejo.

**4. El kit** — los once skills
- ¿Están todos? ¿Se invocan como `/kit:<nombre>`?

**5. Lo que el usuario reporta**
- Si vino con un síntoma concreto, empezá por ahí y contestalo primero. El
  diagnóstico completo va después.

## Paso 2 — Separá en tres

| Grupo | Qué es | Qué hacés |
|---|---|---|
| **Seguro** | Agregar algo que falta, corregir un `description`, actualizar el archivo de config | Arreglalo, y avisá qué tocaste |
| **A confirmar** | Borrar, renombrar, unificar duplicados, reescribir algo que el usuario escribió | Proponelo y esperá el sí |
| **No es tuyo** | Conectar una cuenta, instalar el plugin | Explicá los pasos, no lo intentes |

La línea es simple: **si el arreglo puede borrar trabajo del usuario, se
pregunta.** Sin excepciones, aunque sea obvio.

## Paso 3 — Entregá el diagnóstico

En castellano, sin jerga, en este orden:

```
LO QUE ESTÁ BIEN     2-3 líneas. Va primero y va de verdad.
LO QUE ARREGLÉ       Qué tocaste y qué cambia. Solo lo del grupo Seguro.
LO QUE CONVIENE      Lo del grupo A confirmar, con el porqué. Esperá respuesta.
LO QUE TENÉS QUE     Lo del grupo No es tuyo. Pasos numerados, un click por paso.
HACER VOS
```

Reglas del mensaje:

- **Nunca digas "MCP", "frontmatter", "YAML", "parsear", "ruta absoluta".** Decí
  "el archivo donde están tus preferencias", "la descripción del skill", "la
  conexión con tu correo".
- Si está todo bien, decilo y terminá. No inventes hallazgos para justificar el
  diagnóstico.
- Máximo cinco hallazgos. Si hay más, mostrá los cinco que más pesan y decí
  cuántos quedaron.

## Paso 4 — Cerrá con uno solo

Una sola recomendación de qué hacer ahora. La que más cambia el resultado.

Si el `CLAUDE.md` está vacío o es genérico, esa recomendación es siempre
`mi-claude-md` — no hay nada que rinda más.

---

## Reglas

- **Nunca borres ni sobreescribas sin confirmación explícita.** Ni un skill
  duplicado, ni una línea del CLAUDE.md, ni un archivo que parezca de prueba.
- **Nunca inventes un problema.** Un diagnóstico limpio es un resultado válido.
- **Empezá por el síntoma del usuario**, si trajo uno.
- **Cinco hallazgos como techo.** Una lista de veinte no se lee y no se arregla.
- **Si no podés verificar algo, decí que no pudiste.** Nunca lo des por bueno.

---

## Cómo está hecho este skill

**Qué le pide a Claude y por qué en ese orden.** Revisar todo → recién ahí
separar por riesgo → arreglar. La separación del Paso 2 va después de la revisión
completa a propósito: si arreglás sobre la marcha, terminás tocando ocho cosas
sin que el usuario haya entendido ninguna, y el diagnóstico se vuelve un
misterio.

**Qué decisión podés copiar en el tuyo.** La clasificación por riesgo del Paso 2.
"Seguro / A confirmar / No es tuyo" se puede aplicar a cualquier skill que
modifique cosas. La regla que la hace funcionar es una sola línea: *si puede
borrar trabajo del usuario, se pregunta*. Escribí esa línea en el tuyo.

**Qué pasaría si sacaras esta parte.** Si sacás "LO QUE ESTÁ BIEN" del
entregable, tenés una lista de defectos. A un usuario que recién arranca, eso lo
convence de que hizo todo mal — y el que se convence de eso no vuelve a tocar la
configuración nunca más. El orden del entregable es una decisión sobre qué va a
hacer la persona después de leerlo.

**El techo de cinco.** Mismo principio que en otros skills del kit: un límite de
formato que en realidad es una decisión de método. Veinte hallazgos no son un
diagnóstico más completo, son ninguno.
