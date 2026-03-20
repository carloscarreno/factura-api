package com.igp.factura.controller;

import com.igp.factura.entity.Factura;
import com.igp.factura.service.FacturaService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/facturas")
@RequiredArgsConstructor

public class FacturaController {

    private final FacturaService facturaService;

    @PostMapping
    public ResponseEntity<Factura> crear(@RequestBody Factura factura) {
        return ResponseEntity.ok(facturaService.crearFactura(factura));
    }

    @GetMapping
    public List<Factura> listar() {
        return facturaService.listar();
    }

    @GetMapping("/{id}")
    public Factura obtener(@PathVariable Long id) {
        return facturaService.obtener(id);
    }
}