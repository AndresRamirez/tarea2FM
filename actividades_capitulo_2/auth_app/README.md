# Auth App – Actividad 2: Navegación y Login en Flutter

## Descripción
Aplicación Flutter que implementa autenticación local de usuarios con navegación entre pantallas. Los datos se persisten de forma local utilizando **SharedPreferences**.

---

## Pantallas

### 1. Login Screen
- Campos: correo electrónico y contraseña
- Validación de formato de correo
- Muestra errores claros si las credenciales son incorrectas
- Navega al Home al iniciar sesión exitosamente
- Link a la pantalla de Registro
- Verifica sesión activa al abrir la app

### 2. Register Screen
- Campos: nombre completo, correo, contraseña, verificar contraseña
- Validación de:
  - Campos vacíos
  - Formato de correo electrónico
  - Contraseña mínima de 6 caracteres
  - Coincidencia de contraseñas
  - Correo ya registrado
- Indicador de fortaleza de contraseña (Débil / Media / Fuerte)
- Diálogo de éxito al registrarse
- Navega de regreso al Login tras registro exitoso

### 3. Home Screen
- Muestra el nombre y correo del usuario logueado
- Avatar con iniciales del usuario
- Información de la sesión activa
- Botón de cerrar sesión con confirmación

---

## Tecnologías
| Tecnología | Uso |
|------------|-----|
| Flutter 3.x | Framework de UI |
| Dart | Lenguaje de programación |
| `shared_preferences ^2.3.2` | Almacenamiento local de datos |
| Material Design 3 | Sistema de diseño |

---

## Estructura del proyecto
```
auth_app/
├── lib/
│   ├── main.dart                   # Punto de entrada + tema + SplashRouter
│   ├── screens/
│   │   ├── login_screen.dart       # Pantalla de inicio de sesión
│   │   ├── register_screen.dart    # Pantalla de registro
│   │   └── home_screen.dart        # Pantalla principal
│   ├── services/
│   │   └── auth_service.dart       # Lógica de autenticación con SharedPreferences
│   └── widgets/
│       └── custom_text_field.dart  # Widget reutilizable de campo de texto
├── pubspec.yaml
└── README.md
```

---

## Instalación y ejecución

### Prerrequisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Un dispositivo o emulador disponible

### Pasos
```bash
# Navegar al directorio del proyecto
cd actividades_capitulo_2/auth_app

# Instalar dependencias
flutter pub get

# Ejecutar la app
flutter run
```

---

## Flujo de navegación

```
┌─────────────┐    Registro exitoso    ┌──────────────────┐
│             │ ──────────────────────► │                  │
│  Register   │                         │  Login Screen    │
│  Screen     │ ◄────────────────────── │                  │
└─────────────┘    "Ya tienes cuenta"   └────────┬─────────┘
                                                 │
                                    Login exitoso│
                                                 ▼
                                        ┌────────────────┐
                                        │  Home Screen   │
                                        │                │
                                        └────────────────┘
                                                 │ Cerrar sesión
                                                 ▼
                                        ┌────────────────┐
                                        │  Login Screen  │
                                        └────────────────┘
```

---

## Criterios de evaluación cubiertos

| Criterio | Estado |
|----------|--------|
| ✅ Navegación entre pantallas | Implementado con transiciones animadas |
| ✅ Formulario de registro completo | Nombre, correo, contraseña, verificar contraseña |
| ✅ Validación de contraseñas | Validación de coincidencia y longitud mínima |
| ✅ Guardado local de datos | SharedPreferences |
| ✅ Login funcional hacia Home | Con manejo de sesión persistente |

---

## Capturas de pantalla

> Agregar capturas de las pantallas en ejecución aquí.

| Login | Registro | Home |
|-------|---------|------|
| *(captura)* | *(captura)* | *(captura)* |

---

## Autor
**Actividad 2 – Fundamentos de Flutter**
