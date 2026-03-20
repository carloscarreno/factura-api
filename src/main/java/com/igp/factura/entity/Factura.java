package com.igp.factura.entity;

import jakarta.persistence.*;
import lombok.*;
import java.math.BigDecimal;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "factura")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Factura {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "factura_seq")
    @SequenceGenerator(name = "factura_seq", sequenceName = "factura_id_seq", allocationSize = 1)
    private Long id;

    private String tipoComprobante;
    private String serie;
    private Integer numero;

    private String rucEmisor;
    private String razonSocialEmisor;

    private String tipoDocCliente;
    private String numDocCliente;
    private String nombreCliente;

    private BigDecimal subtotal;
    private BigDecimal igv;
    private BigDecimal total;

    private String estado;

    @OneToMany(mappedBy = "factura", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<FacturaDetalle> detalles;
}