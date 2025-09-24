# Configuración del Proyecto Ecommerce

## Pasos para configurar el entorno de desarrollo

### 1. Instalar dependencias

```bash
bundle install
```

### 2. Configurar variables de entorno

1. Copia el archivo de ejemplo:
```bash
cp env.example .env
```

2. Edita el archivo `.env` con tus valores reales:
   - **Base de datos**: Configura las credenciales de PostgreSQL
   - **Stripe**: Obtén tus claves en [Stripe Dashboard](https://dashboard.stripe.com/apikeys)
   - **PayPal**: Obtén tus claves en [PayPal Developer](https://developer.paypal.com/)
   - **Email**: Configura SMTP (recomendado Mailtrap para desarrollo)

### 3. Configurar base de datos

1. Asegúrate de que PostgreSQL esté ejecutándose
2. Crea las bases de datos:
```bash
rails db:create
rails db:migrate
```

### 4. Generar master key de Rails

```bash
rails credentials:edit
```

Esto abrirá un editor donde puedes agregar claves secretas adicionales.

### 5. Ejecutar el servidor

```bash
rails server
```

## Variables de entorno importantes

### Base de datos
- `DATABASE_NAME`: Nombre de la base de datos de desarrollo
- `DATABASE_USERNAME`: Usuario de PostgreSQL
- `DATABASE_PASSWORD`: Contraseña de PostgreSQL
- `DATABASE_HOST`: Host de PostgreSQL (por defecto localhost)
- `DATABASE_PORT`: Puerto de PostgreSQL (por defecto 5432)

### Pagos
- `STRIPE_PUBLISHABLE_KEY`: Clave pública de Stripe
- `STRIPE_SECRET_KEY`: Clave secreta de Stripe
- `PAYPAL_CLIENT_ID`: Client ID de PayPal
- `PAYPAL_CLIENT_SECRET`: Client Secret de PayPal

### Seguridad
- `JWT_SECRET_KEY`: Clave secreta para tokens JWT
- `RAILS_MASTER_KEY`: Master key de Rails (se genera automáticamente)

## Notas de seguridad

- **NUNCA** subas el archivo `.env` al repositorio
- El archivo `.env` está en `.gitignore` por seguridad
- Usa `env.example` como plantilla para otros desarrolladores
- En producción, configura las variables de entorno en tu servidor/hosting
