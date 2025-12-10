# Script de prueba para DebtCrusher API
Write-Host "`n🧪 Probando DebtCrusher API con MongoDB Atlas...`n" -ForegroundColor Cyan

# 1. Crear un ingreso
Write-Host "1️⃣  Creando ingreso..." -ForegroundColor Yellow
$response1 = Invoke-WebRequest -Uri http://localhost:3000/transactions -Method POST -ContentType "application/json" -Body '{"concept":"Salario Diciembre","amount":1500,"category":"Ingreso"}'
Write-Host $response1.Content -ForegroundColor Green
Write-Host ""

# 2. Crear un gasto
Write-Host "2️⃣  Creando gasto..." -ForegroundColor Yellow
$response2 = Invoke-WebRequest -Uri http://localhost:3000/transactions -Method POST -ContentType "application/json" -Body '{"concept":"Supermercado","amount":-75.50,"category":"Alimentación"}'
Write-Host $response2.Content -ForegroundColor Green
Write-Host ""

# 3. Crear otro gasto
Write-Host "3️⃣  Creando otro gasto..." -ForegroundColor Yellow
$response3 = Invoke-WebRequest -Uri http://localhost:3000/transactions -Method POST -ContentType "application/json" -Body '{"concept":"Netflix","amount":-15.99,"category":"Entretenimiento"}'
Write-Host $response3.Content -ForegroundColor Green
Write-Host ""

# 4. Listar todas las transacciones
Write-Host "4️⃣  Listando todas las transacciones..." -ForegroundColor Yellow
$response4 = Invoke-WebRequest -Uri http://localhost:3000/transactions
Write-Host $response4.Content -ForegroundColor Green
Write-Host ""

# 5. Ver balance
Write-Host "5️⃣  Consultando balance..." -ForegroundColor Yellow
$response5 = Invoke-WebRequest -Uri http://localhost:3000/transactions/balance
Write-Host $response5.Content -ForegroundColor Green
Write-Host ""

Write-Host "✅ Pruebas completadas!" -ForegroundColor Cyan
