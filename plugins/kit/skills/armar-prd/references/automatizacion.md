# Rama automatización — datos y plantillas

Automatización = algo que arranca solo con un disparador y mueve o transforma datos entre
sistemas, sin que nadie abra una pantalla.

## Datos que hacen falta (Paso 0)

Preguntá solo los que el brief no trae.

- **Disparador**: qué la hace arrancar (llega un correo, alguien completa un formulario, todos los
  lunes a las 9, aparece una fila nueva).
- **Cómo se hace hoy a mano**: los pasos, como se los explicaría a alguien que arranca mañana.
- **Entradas**: qué datos llegan y de dónde.
- **Salidas**: qué tiene que quedar hecho y dónde (fila en una planilla, correo enviado, tarea
  creada, contacto en el CRM).
- **Sistemas que toca**: correo, planilla, CRM, calendario, formulario, WhatsApp…
- **Volumen y frecuencia**: cuántas veces por día o semana.
- **Qué no puede fallar**: el paso que, si sale mal, cuesta plata o un cliente.
- **Quién se entera si falla**: a quién avisar y por dónde.
- **Si tiene que correr con la compu apagada**: decide el stack (ver `stack-por-defecto.md`).

## 1/4 — `masterplan.md`

1. **Pitch de 30 segundos** — tres frases: qué dispara, qué hace, qué queda hecho.
2. **Proceso hoy vs. con la automatización** — dos listas de pasos lado a lado.
3. **Valor** — tiempo o errores que se ahorran **solo con los números que dio el usuario**. Si no
   hay números: "a medir", y cómo medirlo (contar cuántas veces por semana, cronometrar una).
4. **Alcance** — qué hace y, en una lista aparte, qué **no** hace.
5. **Stack** — el de `stack-por-defecto.md` salvo que el usuario diga otro, con traducción.
6. **Datos que circulan** — qué campos entran, cuáles salen, cuáles son personales.
7. **Permisos y seguridad** — qué accesos necesita cada sistema, dónde se guardan las claves
   (nunca escritas en el archivo), qué datos personales toca.
8. **Fases** — MVP (el camino feliz, un caso) / V1 (los casos raros, avisos) / V2 (escala, panel).
9. **Riesgos** — cuatro o cinco, con mitigación concreta (datos duplicados, sistema caído,
   formato que cambia, límite de envíos).
10. **Ideas para crecer** — cuatro o cinco.

Cierre: *"¿Avanzo al 2/4: `implementation-plan.md`?"*

## 2/4 — `implementation-plan.md`

1. **Fases para Claude Code** — entre 5 y 9, con el mismo formato que la rama producto:

   ```
   ### Fase N — <nombre>
   Pegale esto a Claude Code:
   > <instrucción completa: qué construir, qué documentos de prd/<nombre>/ leer>
   Listo cuando: <algo que el usuario comprueba sin leer código>
   ```

   Orden de referencia: 0 leer el PRD · 1 conectar cada sistema y comprobar que responde (leer
   una fila, un correo) · 2 el camino feliz con **un** caso de prueba · 3 guardar o enviar la
   salida · 4 casos raros (dato vacío, duplicado, formato distinto) · 5 avisos cuando falla ·
   6 dejarla corriendo sola · 7 una semana en paralelo con el proceso manual antes de apagar
   el manual.
2. **Datos de prueba** — tres casos concretos que el usuario prepara: uno normal, uno raro, uno
   que tiene que fallar con aviso.
3. **Qué necesita tener a mano** — accesos, cuentas, ejemplos reales de entrada.

Cierre: *"¿Avanzo al 3/4: `integraciones-y-datos.md`?"*

## 3/4 — `integraciones-y-datos.md`

Una ficha por sistema:

| Campo | Contenido |
|---|---|
| Sistema | Nombre y para qué se usa acá |
| Lee / escribe | Qué datos saca y qué deja |
| Cómo se conecta | Conector, API, archivo exportado — en castellano |
| Acceso necesario | Qué permiso hay que dar y quién lo da |
| Forma de los datos | Campos con un ejemplo real de cada uno |
| Límites | Cuántas veces por minuto/día deja usarlo, si se sabe; si no, "a confirmar" |

Después: **mapa de campos** (de dónde sale cada dato de la salida) y **reglas de limpieza**
(mayúsculas, teléfonos, fechas, duplicados).

Cierre: *"¿Avanzo al 4/4: `runbook-y-fallos.md`?"*

## 4/4 — `runbook-y-fallos.md`

1. **Qué puede fallar** — tabla por paso: qué falla, cómo se nota, qué hace la automatización
   (reintenta, salta, frena), a quién avisa.
2. **Avisos** — por dónde llegan y qué dicen (qué falló, con qué dato, qué hacer).
3. **Reintentos** — cuántas veces y cada cuánto antes de rendirse y avisar.
4. **Cómo apagarla** — el paso exacto para frenarla en una emergencia.
5. **Cómo saber que anda** — qué mirar una vez por semana.
6. **Recorridos** — tres: caso normal · caso raro que se resuelve solo · caso que necesita a una
   persona.
