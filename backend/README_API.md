# DebtCrusher API

API REST para gestión de transacciones financieras construida con NestJS y MongoDB.

## 🚀 Stack Tecnológico

- **NestJS** - Framework backend
- **Mongoose** - ODM para MongoDB
- **MongoDB** - Base de datos NoSQL

## 📦 Instalación

```bash
# Las dependencias ya están instaladas, pero si necesitas reinstalarlas:
npm install
```

## 🗄️ Base de Datos

El proyecto está configurado para conectarse a MongoDB local:
- **URL**: `mongodb://localhost:27017/debt-crusher`
- **Base de datos**: `debt-crusher`

### Opciones de BD:

1. **MongoDB Local**: Asegúrate de tener MongoDB instalado y corriendo en tu máquina
2. **MongoDB Atlas**: Cambia la URL en `src/app.module.ts` por tu cluster de Atlas

## 🏃 Ejecutar el Proyecto

```bash
# Modo desarrollo (con hot-reload)
npm run start:dev

# Modo producción
npm run start:prod
```

El servidor se iniciará en: `http://localhost:3000`

## 📍 Endpoints

### 1. Crear Transacción
**POST** `/transactions`

Crea una nueva transacción (ingreso o gasto).

**Body:**
```json
{
  "concept": "Supermercado",
  "amount": -50.75,
  "category": "Alimentación"
}
```

**Notas:**
- `amount`: Positivo para ingresos, negativo para gastos
- `createdAt`: Se genera automáticamente

**Ejemplo con curl:**
```bash
curl -X POST http://localhost:3000/transactions \
  -H "Content-Type: application/json" \
  -d "{\"concept\":\"Salario\",\"amount\":1500,\"category\":\"Ingreso\"}"
```

### 2. Listar Transacciones
**GET** `/transactions`

Obtiene todas las transacciones registradas.

**Respuesta:**
```json
[
  {
    "_id": "...",
    "concept": "Salario",
    "amount": 1500,
    "category": "Ingreso",
    "createdAt": "2025-12-10T...",
    "__v": 0
  },
  {
    "_id": "...",
    "concept": "Supermercado",
    "amount": -50.75,
    "category": "Alimentación",
    "createdAt": "2025-12-10T...",
    "__v": 0
  }
]
```

**Ejemplo con curl:**
```bash
curl http://localhost:3000/transactions
```

### 3. Obtener Balance (BONUS)
**GET** `/transactions/balance`

Calcula el balance total y estadísticas de ingresos/gastos.

**Respuesta:**
```json
{
  "balance": 1449.25,
  "totalIncome": 1500,
  "totalExpense": 50.75
}
```

**Ejemplo con curl:**
```bash
curl http://localhost:3000/transactions/balance
```

## 📊 Modelo de Datos

### Transaction Schema

```typescript
{
  concept: string,      // Concepto de la transacción
  amount: number,       // Monto (+ ingreso, - gasto)
  category: string,     // Categoría
  createdAt: Date      // Fecha de creación (automática)
}
```

## 🧪 Ejemplos de Uso

### Agregar un ingreso:
```bash
curl -X POST http://localhost:3000/transactions \
  -H "Content-Type: application/json" \
  -d "{\"concept\":\"Freelance\",\"amount\":300,\"category\":\"Trabajo\"}"
```

### Agregar un gasto:
```bash
curl -X POST http://localhost:3000/transactions \
  -H "Content-Type: application/json" \
  -d "{\"concept\":\"Netflix\",\"amount\":-15.99,\"category\":\"Entretenimiento\"}"
```

### Ver balance:
```bash
curl http://localhost:3000/transactions/balance
```

## 📁 Estructura del Proyecto

```
backend/
├── src/
│   ├── transactions/
│   │   ├── dto/
│   │   │   └── create-transaction.dto.ts
│   │   ├── schemas/
│   │   │   └── transaction.schema.ts
│   │   ├── transactions.controller.ts
│   │   ├── transactions.service.ts
│   │   └── transactions.module.ts
│   ├── app.module.ts
│   └── main.ts
└── package.json
```

## ✅ Características Implementadas

- ✅ Proyecto NestJS configurado
- ✅ Conexión a MongoDB con Mongoose
- ✅ Módulo de transacciones completo
- ✅ Schema de Transaction con timestamps automáticos
- ✅ POST /transactions - Crear transacciones
- ✅ GET /transactions - Listar todas las transacciones
- ✅ GET /transactions/balance - Obtener balance total (BONUS)

## 🎯 Próximos Pasos

- Agregar validación de datos con `class-validator`
- Implementar filtros por fecha y categoría
- Agregar paginación
- Implementar tests unitarios y e2e
- Agregar autenticación JWT
- Crear endpoints para actualizar y eliminar transacciones

## 📝 Notas

- Asegúrate de tener MongoDB corriendo antes de iniciar la aplicación
- El modo desarrollo (`npm run start:dev`) recarga automáticamente los cambios
- Los datos se persisten en la base de datos `debt-crusher`
