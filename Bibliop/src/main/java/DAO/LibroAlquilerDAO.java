/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Libro;
import Entity.LibroAlquiler;
import Entity.LibroVenta;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class LibroAlquilerDAO extends Conexion{
    public ArrayList<LibroAlquiler> listaLibros() throws Exception {
        ArrayList<LibroAlquiler> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "call listaInventarioAlquiler()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                LibroAlquiler libA = new LibroAlquiler();
                Libro lib = new Libro();
                lib.setId_libro(rt.getInt("lib.id_libro"));
                lib.setTitulo(rt.getString("lib.titulo"));
                lib.setCosto(rt.getDouble("lib.costo"));
                lib.setPortada(rt.getString("lib.portada"));
                libA.setExistencia(rt.getInt("liba.existencia"));
                libA.setLibro(lib);
                lista.add(libA);
            }
        } catch (Exception e) {
            System.out.println("Error libA-dao.. " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
