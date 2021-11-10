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
public class LibroAlquiler {
    private int reg_libroAlquiler;
    private Libro libro;
    private int existencia;

    public int getReg_libroAlquiler() {
        return reg_libroAlquiler;
    }

    public void setReg_libroAlquiler(int reg_libroAlquiler) {
        this.reg_libroAlquiler = reg_libroAlquiler;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }
    
}
