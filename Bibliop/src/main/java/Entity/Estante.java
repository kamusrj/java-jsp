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
public class Estante {
    private int id_estante;
    private int numero_estante;
    private Pasillo pasillo;

    public int getId_estante() {
        return id_estante;
    }

    public void setId_estante(int id_estante) {
        this.id_estante = id_estante;
    }

    public int getNumero_estante() {
        return numero_estante;
    }

    public void setNumero_estante(int numero_estante) {
        this.numero_estante = numero_estante;
    }

    public Pasillo getPasillo() {
        return pasillo;
    }

    public void setPasillo(Pasillo pasillo) {
        this.pasillo = pasillo;
    }
    
}
