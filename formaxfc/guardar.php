<?php
header('Content-Type: application/json');

// ==== Datos de conexión (ajusta según tu servidor) ====
$host = "localhost";
$usuario = "root";
$password = "";
$base_datos = "formax_fc";

$conn = new mysqli($host, $usuario, $password, $base_datos);

if ($conn->connect_error) {
    echo json_encode([
        "status" => "error",
        "message" => "No se pudo conectar a la base de datos."
    ]);
    exit;
}

$nombre   = $conn->real_escape_string($_POST['nombre'] ?? '');
$correo   = $conn->real_escape_string($_POST['correo'] ?? '');
$telefono = $conn->real_escape_string($_POST['telefono'] ?? '');
$mensaje  = $conn->real_escape_string($_POST['mensaje'] ?? '');

if ($nombre === '' || $correo === '' || $mensaje === '') {
    echo json_encode([
        "status" => "error",
        "message" => "Por favor completa los campos obligatorios."
    ]);
    exit;
}

$sql = "INSERT INTO contactos (nombre, correo, telefono, mensaje)
        VALUES ('$nombre', '$correo', '$telefono', '$mensaje')";

if ($conn->query($sql) === TRUE) {
    echo json_encode([
        "status" => "success",
        "message" => "¡Gracias! Tu mensaje fue enviado correctamente."
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Ocurrió un error al guardar tu mensaje."
    ]);
}

$conn->close();
?>
