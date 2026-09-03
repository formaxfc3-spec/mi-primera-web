-- =============================================
-- Base de datos: Formax FC
-- Script para crear la base de datos y la tabla
-- que recibirá los mensajes del formulario de contacto
-- =============================================

CREATE DATABASE IF NOT EXISTS formax_fc
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE formax_fc;

-- Tabla para guardar los mensajes enviados desde el formulario de contacto
CREATE TABLE IF NOT EXISTS contactos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(30),
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- (Opcional) Tabla básica de jugadores, pensada para la futura
-- "Formax Sport App" mencionada en la página: registro de jugadores,
-- pagos y asistencia. Puedes borrar esta sección si solo necesitas
-- el formulario de contacto.
CREATE TABLE IF NOT EXISTS jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE,
    acudiente VARCHAR(150),
    telefono_acudiente VARCHAR(30),
    categoria VARCHAR(50),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    concepto VARCHAR(100),
    fecha_pago DATE NOT NULL,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS asistencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jugador_id INT NOT NULL,
    fecha DATE NOT NULL,
    asistio BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (jugador_id) REFERENCES jugadores(id) ON DELETE CASCADE
) ENGINE=InnoDB;
