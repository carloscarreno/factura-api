package com.igp.factura.repository;

import com.igp.factura.entity.Factura;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacturaRepository extends JpaRepository<Factura, Long> {
}