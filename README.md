# 💰 DebtCrusher API

API REST para gestión de transacciones financieras (ingresos y gastos) construida con NestJS y MongoDB Atlas.

## 🚀 Stack Tecnológico

- **Backend:** NestJS
- **Base de Datos:** MongoDB (Mongoose ODM)
- **Cloud:** MongoDB Atlas

## ✨ Características

- ✅ CRUD de transacciones financieras
- ✅ Cálculo automático de balance
- ✅ Diferenciación entre ingresos (positivos) y gastos (negativos)
- ✅ Categorización de transacciones
- ✅ Timestamps automáticos

## 📦 Instalación

```bash
# Clonar repositorio
git clone https://github.com/TU-USUARIO/debt-crusher-api.git
cd debt-crusher-api

# Instalar dependencias
cd backend
npm install
```

## ⚙️ Configuración

1. **Configura MongoDB Atlas:**
   - Crea una cuenta en [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
   - Crea un cluster gratuito (M0)
   - Obtén tu connection string

2. **Configura la conexión:**
   - Edita `backend/src/app.module.ts`
   - Reemplaza la URL de MongoDB con tu connection string

```typescript
MongooseModule.forRoot('tu-connection-string-aqui')
```

## 🏃 Ejecutar

```bash
cd backend

# Modo desarrollo
npm run start:dev

# Modo producción
npm run start:prod
```

El servidor se iniciará en `http://localhost:3000`

## 📍 Endpoints

### **POST** `/transactions`
Crea una nueva transacción

**Body:**
```json
{
  "concept": "Salario",
  "amount": 2000,
  "category": "Ingreso"
}
```

### **GET** `/transactions`
Lista todas las transacciones

### **GET** `/transactions/balance`
Obtiene el balance total con estadísticas

**Respuesta:**
```json
{
  "balance": 1408.51,
  "totalIncome": 2000,
  "totalExpense": 591.49
}
```

## 🧪 Pruebas

### Con PowerShell:
```powershell
cd backend
.\test-api.ps1
```

### Con REST Client (VS Code):
Abre `backend/api-requests.http` y usa los requests de ejemplo

### Con Postman:
Importa la colección desde la documentación del proyecto

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
├── test-api.ps1
├── api-requests.http
└── package.json
```

## 🎯 Modelo de Datos

```typescript
{
  concept: string,    // Descripción de la transacción
  amount: number,     // Monto (+ ingreso, - gasto)
  category: string,   // Categoría
  createdAt: Date    // Fecha de creación (automática)
}
```

## 🔒 Seguridad

- ⚠️ **NO subas tu connection string a GitHub**
- Usa variables de entorno para información sensible
- Configura correctamente las IPs permitidas en MongoDB Atlas

## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📝 Licencia

Este proyecto está bajo la Licencia MIT.

## 👤 Autor

Angel Sandoval- [@magexd](https://github.com/magexd)

---

⭐ Si te gustó este proyecto, dale una estrella en GitHub!
