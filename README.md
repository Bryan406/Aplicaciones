# Sistema Experto en Prolog - Taller 1

Este proyecto contiene un sistema experto en Prolog que permite diagnosticar enfermedades y recomendar tratamientos basados en síntomas dados por el usuario. A continuación, se explican los pasos necesarios para configurar y ejecutar el archivo `Taller1.pl`.

---

## Tabla de Contenidos
1. [Descripción del Proyecto](#descripción-del-proyecto)
2. [Requisitos Previos](#requisitos-previos)
3. [Instrucciones de Instalación y Uso](#instrucciones-de-instalación-y-uso)
4. [Ejemplo de Consultas](#ejemplo-de-consultas)
5. [Notas y Solución de Problemas](#notas-y-solución-de-problemas)
6. [Licencia](#licencia)

---

## Descripción del Proyecto

El archivo `Taller1.pl` contiene una base de conocimiento en Prolog que incluye:
- Síntomas y sus enfermedades asociadas.
- Medicamentos recomendados para enfermedades específicas.
- Médicos especialistas en diferentes patologías.
- Reglas que permiten realizar diagnósticos y sugerir tratamientos completos.

Este sistema experto está diseñado como una herramienta de aprendizaje y puede ser extendido con más conocimientos.

---

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

1. **Git**:
   - Descarga e instala Git desde [https://git-scm.com/](https://git-scm.com/).
   
2. **SWI-Prolog**:
   - Descarga e instala SWI-Prolog desde [https://www.swi-prolog.org/](https://www.swi-prolog.org/).
   - Verifica que SWI-Prolog esté instalado ejecutando en la terminal:
     ```bash
     swipl --version
     ```

---

## Instrucciones de Instalación y Uso

Sigue estos pasos para clonar el repositorio, cargar el archivo `Taller1.pl` y comenzar a usarlo:

1. **Clonar el repositorio**:
   Abre una terminal o consola y ejecuta el siguiente comando para clonar el repositorio:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
# Instrucciones de Instalación y Uso

Sigue estos pasos para clonar el repositorio, cargar el archivo `Taller1.pl` y comenzar a usarlo:

2. **Acceder al directorio del proyecto**:
   Navega al directorio del proyecto recién clonado:
   ```bash
   cd <NOMBRE_DEL_REPOSITORIO>

3. Acceder al directorio del proyecto

Una vez que hayas clonado el repositorio, navega al directorio del proyecto recién clonado. Puedes hacerlo con el siguiente comando:
    ```bash
    cd <NOMBRE_DEL_REPOSITORIO>

Reemplaza NOMBRE_DEL_REPOSITORIO con el nombre del directorio correspondiente
4. **Abrir SWI-Prolog**:
    Para trabajar con el archivo `Taller1.pl`, abre SWI-Prolog desde la terminal ejecutando el siguiente comando:
    ```bash
    swipl
    ```
    Esto iniciará la interfaz de SWI-Prolog en la terminal.

5. **Cargar el archivo `Taller1.pl`**:
    Una vez que estés dentro de la interfaz de SWI-Prolog, carga el archivo `Taller1.pl` ejecutando el siguiente comando:
    ```prolog
    consult('Taller1.pl').
    ```
    Esto cargará el archivo y podrás comenzar a ejecutar consultas y reglas definidas en él.

6. **Realizar consultas**:
    Una vez que hayas cargado el archivo correctamente, puedes realizar las consultas definidas en el archivo. En el archivo `Taller1.pl`, las consultas están comentadas, por lo que no es necesario ejecutarlas de inmediato, pero si deseas probar alguna, puedes hacerlo directamente en la consola de SWI-Prolog.

    Consultas disponibles (comentadas en el archivo `Taller1.pl`):
    - **¿Qué especialista atiende la gripe?** Consulta comentada en el archivo, puedes activarla para verificar qué especialista está relacionado con la gripe.
    - **¿Qué medicina trata la tuberculosis?** Consulta comentada en el archivo, puedes activarla para obtener información sobre la medicina que trata la tuberculosis.
    - **¿Qué síntomas tiene la malaria?** Consulta comentada en el archivo, activa esta para conocer los síntomas asociados con la malaria.
    - **¿Qué enfermedades causan fiebre?** Consulta comentada en el archivo, puedes activar esta para obtener las enfermedades asociadas con fiebre.
    - **¿Cuál es la probabilidad de tener hepatitis si tengo ictericia y dolor abdominal?** Consulta comentada en el archivo, puedes activarla para calcular la probabilidad de tener hepatitis con esos síntomas.
    - **¿Qué especialista y medicina se necesitan para la anemia?** Consulta comentada en el archivo, activa esta para obtener el especialista y la medicina recomendados para la anemia.

    Las consultas están comentadas para que puedas activarlas cuando lo necesites.


