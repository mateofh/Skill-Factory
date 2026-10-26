# Stack sugerido

Es el default **si el usuario no pide otro**. Se presenta como sugerencia, nunca como decisión
tomada. Cada pieza va en el documento con su traducción en la misma línea.

## Producto

| Pieza | Sugerido | Cómo explicarlo |
|---|---|---|
| Página / app | Vite + React + TypeScript | "el esqueleto de la página" |
| Estilo | Tailwind + shadcn/ui | "los estilos y componentes ya armados: botones, formularios, tarjetas" |
| Datos | Supabase | "la base de datos donde quedan los registros, con plan gratis" |
| Publicar | Vercel | "donde queda publicada la página con su dirección web, con plan gratis" |
| Correos | Resend | "el servicio que manda los correos automáticos" |
| Login | No en el MVP | "nadie necesita usuario y contraseña para la primera versión" |

Si el usuario ya usa otra cosa (WordPress, Webflow, Kajabi, su propio hosting), se respeta y se
adapta el plan: el PRD sirve igual.

## Automatización

Elegí según una pregunta: **¿tiene que correr con la computadora apagada?**

| Respuesta | Sugerido | Cómo explicarlo |
|---|---|---|
| No — la corre el usuario cuando la necesita | Un skill o script de Claude Code con los conectores que ya tenga (correo, calendario, Drive) | "un comando que corrés vos y hace todo el recorrido" |
| Sí — tiene que reaccionar sola a toda hora | n8n o Make | "una herramienta en internet que queda escuchando y corre sola" |
| Sí, y es muy simple (formulario → planilla → correo) | Las automatizaciones nativas de la herramienta (Google Forms + Apps Script, Microsoft Power Automate) | "lo que ya trae la herramienta que usás" |

Antes de sugerir algo pago, preguntá. Las claves de acceso nunca se escriben en los documentos
del PRD: se dice dónde se guardan.
