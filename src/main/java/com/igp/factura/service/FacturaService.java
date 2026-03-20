package com.igp.factura.service;

import com.igp.factura.entity.Factura;
import com.igp.factura.repository.FacturaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FacturaService {

    @Autowired
    private final FacturaRepository facturaRepository;

    @Transactional
    public Factura crearFactura(Factura factura) {
        if (factura.getDetalles() != null) {
            factura.getDetalles().forEach(d -> d.setFactura(factura));
        }
        return facturaRepository.save(factura);
    }

    public List<Factura> listar() {
        return facturaRepository.findAll();
    }

    public Factura obtener(Long id) {
        return facturaRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Factura no encontrada"));
    }
}