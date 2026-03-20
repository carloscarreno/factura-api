CREATE TABLE factura (
    id SERIAL PRIMARY KEY,

    -- Datos del comprobante
    tipo_comprobante VARCHAR(2) NOT NULL, -- 01: Factura, 03: Boleta
    serie VARCHAR(4) NOT NULL,
    numero INTEGER NOT NULL,

    -- Datos del emisor
    ruc_emisor CHAR(11) NOT NULL,
    razon_social_emisor VARCHAR(150) NOT NULL,

    -- Datos del cliente
    tipo_doc_cliente VARCHAR(2) NOT NULL, -- 6: RUC, 1: DNI
    num_doc_cliente VARCHAR(15) NOT NULL,
    nombre_cliente VARCHAR(150) NOT NULL,

    -- Fechas
    fecha_emision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Montos
    moneda CHAR(3) NOT NULL DEFAULT 'PEN', -- PEN o USD
    subtotal NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    total NUMERIC(12,2) NOT NULL,

    -- Estado
    estado VARCHAR(20) DEFAULT 'EMITIDA', -- EMITIDA, ANULADA, PAGADA

    -- Control
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE factura_detalle (
    id SERIAL PRIMARY KEY,
    factura_id INTEGER NOT NULL,

    descripcion VARCHAR(255) NOT NULL,
    cantidad NUMERIC(10,2) NOT NULL,
    precio_unitario NUMERIC(12,2) NOT NULL,
    subtotal NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    total NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_factura
        FOREIGN KEY (factura_id)
        REFERENCES factura(id)
        ON DELETE CASCADE
);

INSERT INTO factura (
    id, tipo_comprobante, serie, numero,
    ruc_emisor, razon_social_emisor,
    tipo_doc_cliente, num_doc_cliente, nombre_cliente,
    subtotal, igv, total
) VALUES
(nextval('factura_id_seq'),'01','F001',1,'20123456789','TYG SAC','6','20456789012','MAPFRE SAC',100,18,118),
(nextval('factura_id_seq'),'01','F001',2,'20123456789','TYG SAC','1','12345678','JUAN PEREZ',50,9,59),
(nextval('factura_id_seq'),'01','F001',3,'20123456789','TYG SAC','6','20567890123','COMERCIAL ABC SAC',200,36,236),
(nextval('factura_id_seq'),'01','F001',4,'20123456789','TYG SAC','1','87654321','MARIA LOPEZ',80,14.4,94.4),
(nextval('factura_id_seq'),'01','F001',5,'20123456789','TYG SAC','6','20678901234','INDUSTRIAS XYZ SAC',150,27,177),
(nextval('factura_id_seq'),'01','F001',6,'20123456789','TYG SAC','1','11223344','CARLOS RAMIREZ',120,21.6,141.6),
(nextval('factura_id_seq'),'01','F001',7,'20123456789','TYG SAC','6','20789012345','SERVICIOS GENERALES SAC',300,54,354),
(nextval('factura_id_seq'),'01','F001',8,'20123456789','TYG SAC','1','22334455','ANA TORRES',75,13.5,88.5),
(nextval('factura_id_seq'),'01','F001',9,'20123456789','TYG SAC','6','20890123456','LOGISTICA PERU SAC',500,90,590),
(nextval('factura_id_seq'),'01','F001',10,'20123456789','TYG SAC','1','33445566','LUIS GOMEZ',60,10.8,70.8),

(nextval('factura_id_seq'),'01','F002',11,'20123456789','TYG SAC','6','20901234567','IMPORTACIONES SAC',1000,180,1180),
(nextval('factura_id_seq'),'01','F002',12,'20123456789','TYG SAC','1','44556677','ELENA VARGAS',90,16.2,106.2),
(nextval('factura_id_seq'),'01','F002',13,'20123456789','TYG SAC','6','20112233445','CONSTRUCTORA PERU SAC',750,135,885),
(nextval('factura_id_seq'),'01','F002',14,'20123456789','TYG SAC','1','55667788','PEDRO CASTRO',45,8.1,53.1),
(nextval('factura_id_seq'),'01','F002',15,'20123456789','TYG SAC','6','20223344556','MINERA ANDINA SAC',2000,360,2360),
(nextval('factura_id_seq'),'01','F002',16,'20123456789','TYG SAC','1','66778899','ROSA MENDOZA',110,19.8,129.8),
(nextval('factura_id_seq'),'01','F002',17,'20123456789','TYG SAC','6','20334455667','AGROINDUSTRIA SAC',640,115.2,755.2),
(nextval('factura_id_seq'),'01','F002',18,'20123456789','TYG SAC','1','77889900','JORGE FLORES',70,12.6,82.6),
(nextval('factura_id_seq'),'01','F002',19,'20123456789','TYG SAC','6','20445566778','TRANSPORTES SAC',890,160.2,1050.2),
(nextval('factura_id_seq'),'01','F002',20,'20123456789','TYG SAC','1','88990011','CARMEN DIAZ',55,9.9,64.9);

INSERT INTO factura_detalle (
    factura_id, descripcion, cantidad, precio_unitario, subtotal, igv, total
) VALUES

-- Factura 1
(1,'Laptop Lenovo',1,100,100,18,118),

-- Factura 2
(2,'Mouse Logitech',2,25,50,9,59),

-- Factura 3
(3,'Monitor Samsung',2,100,200,36,236),

-- Factura 4
(4,'Teclado Mecánico',1,80,80,14.4,94.4),

-- Factura 5
(5,'Disco SSD 1TB',1,150,150,27,177),

-- Factura 6
(6,'Memoria RAM 16GB',2,60,120,21.6,141.6),

-- Factura 7
(7,'Impresora HP',1,300,300,54,354),

-- Factura 8
(8,'Audífonos',3,25,75,13.5,88.5),

-- Factura 9
(9,'Servidor Dell',1,500,500,90,590),

-- Factura 10
(10,'Router Cisco',2,30,60,10.8,70.8),

-- Factura 11 (2 items)
(11,'Laptop HP',1,600,600,108,708),
(11,'Mouse HP',2,200,400,72,472),

-- Factura 12
(12,'Tablet Samsung',1,90,90,16.2,106.2),

-- Factura 13 (2 items)
(13,'Cemento',10,50,500,90,590),
(13,'Arena',5,50,250,45,295),

-- Factura 14
(14,'Cable HDMI',3,15,45,8.1,53.1),

-- Factura 15
(15,'Excavadora',1,2000,2000,360,2360),

-- Factura 16
(16,'Silla Oficina',2,55,110,19.8,129.8),

-- Factura 17
(17,'Fertilizante',4,160,640,115.2,755.2),

-- Factura 18
(18,'Lámpara LED',5,14,70,12.6,82.6),

-- Factura 19
(19,'Servicio Transporte',1,890,890,160.2,1050.2),

-- Factura 20
(20,'Cuaderno',5,11,55,9.9,64.9);
