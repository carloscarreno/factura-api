package com.igp.factura.repository;

import com.igp.factura.entity.Factura;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface FacturaRepository extends JpaRepository<Factura, Long> {
    Page<Factura> findByNombreClienteContainingIgnoreCase(String nombre, Pageable pageable);
}