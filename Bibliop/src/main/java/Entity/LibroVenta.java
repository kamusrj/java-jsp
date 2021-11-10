/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Gustavo
 */
public class LibroVenta {
    private int reg_libroVenta;
    private Libro libro;
    private int stock;
    private int existencia;
    private double precio_venta;

    public int getReg_libroVenta() {
        return reg_libroVenta;
    }

    public void setReg_libroVenta(int reg_libroVenta) {
        this.reg_libroVenta = reg_libroVenta;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }
    
}
