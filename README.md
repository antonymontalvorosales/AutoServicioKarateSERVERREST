# SERVERREST-KARATE-API

![CI Pipeline](https://github.com/antonymontalvorosales/AutoServicioKarateSERVERREST/actions/workflows/ci.yml/badge.svg)

Proyecto de **pruebas automatizadas** para la API **Serverest**, desarrollado con **Karate DSL** y gestionado con **Maven**.  
Incluye integración con **Allure** para generar reportes visuales de ejecución.

---

## 🚀 Características principales
- CRUD de usuarios implementado en **Karate** (`crear`, `consultar`, `actualizar`, `eliminar`).
- Estructura modular con `src/main` y `src/test`.
- Integración con **Maven** para compilación y ejecución.
- Reportes dinámicos con **Allure** (`allure-results/` y `allure-report/`).
- Configuración de `.gitignore` para mantener el repositorio limpio.
- Preparado para integración en **CI/CD pipelines** (GitHub Actions, Jenkins, Azure DevOps).

---

## ⚙️ Requisitos previos
- **Java 11+**
- **Maven 3.6+**
- **Karate DSL**
- **Allure Commandline** (para visualizar reportes)

---

## ▶️ Instalación y ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/TuUsuario/serverest-karate-api.git
   cd serverest-karate-api
    ```  
2. **Ejecutar pruebas con Maven:**
```bash
   mvn test
```

3. **Generar y visualizar reportes con Allure:**
```bash
   mvn allure:report
   mvn allure:serve
```

---

> 💡 Asegúrate de tener configurado el `PATH` de Allure para que `mvn allure:serve` funcione correctamente.


   