/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

/**
 *
 * @author Gustavo
 */
public class test {
    public static void main(String[] args) {
        Conexion cn = new Conexion();
        try {
            cn.conectar();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
