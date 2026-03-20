package com.igp.factura.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "factura_detalle")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FacturaDetalle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String descripcion;
    private BigDecimal cantidad;
    private BigDecimal precioUnitario;
    private BigDecimal subtotal;
    private BigDecimal igv;
    private BigDecimal total;

    @ManyToOne
    @JoinColumn(name = "factura_id")
    @JsonBackReference
    private Factura factura;
}