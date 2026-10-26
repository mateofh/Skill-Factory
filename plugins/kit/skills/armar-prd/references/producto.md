# Rama producto — datos y plantillas

Producto = algo que una persona abre y usa: landing, app, herramienta interna, portal.

## Datos que hacen falta (Paso 0)

Preguntá solo los que el brief no trae.

- **Qué es y para qué**: el objetivo en una frase (registrar gente a un webinar, vender un
  curso, que el equipo cargue pedidos…).
- **Para quién**: el usuario principal en una línea.
- **Acción principal**: qué tiene que hacer la persona (registrarse, comprar, cargar, reservar) y
  qué datos se le piden.
- **Fechas y urgencia**, si aplica: fecha y hora del evento, cupos, cierre, bonus que vence.
- **Prueba**: testimonios, números, logos, credenciales que ya tenga. Si no tiene, se deja el
  lugar marcado "pendiente", no se inventa.
- **Colores**: los de marca, o la sensación que busca para proponer una paleta. Siempre preguntar.
- **Tono**: cómo se tiene que sentir (seria, cálida, urgente sin presión…).
- **Otras pantallas o roles**: ¿hay alguien que administra? ¿hay login?

## 1/4 — `masterplan.md`

1. **Pitch de 30 segundos** — tres frases: qué es, cómo convierte o qué resuelve, qué hace el usuario.
2. **Problema y misión** — tres puntos concretos del problema; misión en una frase orientada a que
   decir "sí" sea fácil.
3. **Audiencia** — perfil en una línea. Qué necesita para decidir: prueba, razón para hoy, claridad.
4. **Funcionalidades** — una entrada por sección o pantalla, con qué contiene. Para una landing de
   evento, la referencia es: Hero (titular + acción + urgencia + formulario) · "Vas a salir con…"
   · Agenda en tarjetas · Quién lo da · Prueba social · Preguntas frecuentes · Página de gracias
   (confirmación + agregar al calendario + siguiente paso).
5. **Stack** — el de `stack-por-defecto.md` salvo que el usuario diga otro, cada pieza con su
   traducción en castellano.
6. **Datos que se guardan** — entidades en texto, con sus campos. Ejemplo landing: Registro (id,
   nombre, email, whatsapp opcional, fecha, utm_*, de dónde vino, consentimiento) · Evento (id,
   título, fecha, cupos, bonus, cierre de inscripción).
7. **Principios de diseño** — se entiende en 5 segundos · escenas, no pantallas · iterar por
   emoción · el movimiento como amabilidad.
8. **Seguridad y privacidad** — pedir lo mínimo, consentimiento explícito, anti-spam (campo
   trampa + límite de envíos), aviso de privacidad.
9. **Fases** — MVP / V1 / V2, con qué entra en cada una.
10. **Riesgos** — cuatro o cinco, cada uno con su mitigación concreta.
11. **Ideas para crecer** — cuatro o cinco.

Cierre: *"¿Avanzo al 2/4: `implementation-plan.md`?"*

## 2/4 — `implementation-plan.md`

1. **Fases para Claude Code** — entre 6 y 10. Cada una con este formato:

   ```
   ### Fase N — <nombre>
   Pegale esto a Claude Code:
   > <instrucción completa: qué construir, qué documentos de prd/<nombre>/ leer>
   Listo cuando: <algo que el usuario comprueba mirando o probando, sin leer código>
   ```

   Orden de referencia para una landing: 0 leer el PRD · 1 textos sin diseño (titular, subtítulo,
   dos beneficios, acción, urgencia) · 2 estructura de la página · 3 diseño base con los colores
   aprobados · 4 formulario con validación y mensajes · 5 guardar registros y medir visitas ·
   6 correos (inmediato, 24 h antes, 1 h antes) · 7 página de gracias + calendario · 8 revisión
   en celular, accesibilidad y test de 5 segundos · 9 publicar con dominio y tres registros reales
   de prueba.
2. **Test de 10 minutos por fase** — mostrarle la página a alguien y preguntarle: ¿qué es?, ¿para
   quién?, ¿cuándo?, ¿qué gano?, ¿cómo me anoto?
3. **Qué necesita tener a mano el usuario antes de empezar** — cuentas, textos, fotos, dominio.
4. **Extras opcionales** — calendario, píxel de anuncios, enviar al CRM, barra de cupos.

Cierre: *"¿Avanzo al 3/4: `design-guidelines.md`?"*

## 3/4 — `design-guidelines.md`

**Colores: solo los aprobados en el Paso 0.** Tokens a cubrir (hex + RGB de cada uno):

| Token | Para qué |
|---|---|
| Primary | Confianza, encabezados, fondos principales |
| Accent | Solo acción y urgencia: botones y etiquetas |
| Background | Fondo general |
| Surface | Tarjetas |
| Text Primary / Text Muted | Texto principal / secundario |
| Border | Bordes suaves |
| Success / Error / Warning | Confirmaciones / errores / avisos |

Si el usuario dio solo dos o tres colores, completá el resto en armonía y mostralos como
propuesta para aprobar.

Secciones:

1. **Tono emocional** — la tesis en una frase y los principios que la sostienen.
2. **Tres escenas** — entiendo en 5 segundos · baja el riesgo · me anoto sin pensar.
3. **Tipografía** — par de fuentes, jerarquía H1–H4 + cuerpo + nota con tamaños desktop/celular y
   pesos. Sin mayúsculas sostenidas; la urgencia se marca con estructura, no con gritos.
4. **Colores** — la tabla de arriba con valores, reglas del Accent (escaso = poderoso), modo
   oscuro opcional.
5. **Espaciado** — grilla de 8 px, escala 4–64, acción principal visible tres veces, celular primero.
6. **Movimiento** — 200–300 ms, ease-out. Hover del botón, foco visible, aparición al bajar,
   validación, confirmación.
7. **Voz** — personalidad en cinco palabras; ejemplos de texto para bienvenida, urgencia, ayuda
   del formulario, éxito y error.
8. **Consistencia** — patrón Dato → Beneficio → Acción.
9. **Accesibilidad** — contraste AA, navegación con teclado, etiquetas reales, estados visibles.
10. **Checklist emocional** — cinco preguntas sí/no.
11. **Checklist técnico** — seis o siete verificaciones.
12. **Resumen** — tabla: paleta, escala tipográfica, espaciado, tesis emocional.
13. **Revisión de coherencia** — un párrafo.

Cierre: *"¿Avanzo al 4/4: `app-flow.md`?"*

## 4/4 — `app-flow.md`

1. **Mapa de páginas** — ej. `/` landing · `/gracias` · opcionales `/privacidad`, `/terminos`, `/replay`.
2. **Para qué sirve cada página** — una o dos líneas.
3. **Roles** — visitante, registrado (sin login), administrador, y los que agregue V2.
4. **Recorridos** — cuatro, de máximo tres pasos cada uno. Referencia landing:
   decidido → entiende → se anota · tibio → necesita prueba → se anota · con objeción → preguntas
   frecuentes → se anota · registrado → correo → calendario → asiste.
