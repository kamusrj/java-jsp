/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.LibroVenta;
import Entity.Libro;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class LibroVentaDAO extends Conexion {

    public ArrayList<LibroVenta> listaLibros() throws Exception {
        ArrayList<LibroVenta> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "call listaInventarioVenta()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                LibroVenta libV = new LibroVenta();
                Libro lib = new Libro();
                lib.setId_libro(rt.getInt("lib.id_libro"));
                lib.setTitulo(rt.getString("lib.titulo"));
                lib.setCosto(rt.getDouble("lib.costo"));
                lib.setPortada(rt.getString("lib.portada"));
                libV.setExistencia(rt.getInt("libv.existencia"));
                libV.setStock(rt.getInt("libv.stock"));
                libV.setPrecio_venta(rt.getDouble("libv.precio_venta"));
                libV.setLibro(lib);
                lista.add(libV);
            }
        } catch (Exception e) {
            System.out.println("Error libV-dao.. " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public ArrayList<Libro> listaDisponibles() throws Exception {
        ArrayList<Libro> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "call listaDisponiblesVenta()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                Libro lib = new Libro();
                lib.setId_libro(rt.getInt("lib.id_libro"));
                lib.setTitulo(rt.getString("lib.titulo"));
                lista.add(lib);
            }
        } catch (Exception e) {
            System.out.println("Error libV-dao.. " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public String guardar(LibroVenta lib) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "insert into dblibroventa(id_libro,stock,existencia,precio_venta) values(?,?,?,?);";
            PreparedStatement st = this.getConector().prepareStatement(query);
            st.setInt(1, lib.getLibro().getId_libro());
            st.setInt(2, lib.getStock());
            st.setInt(3, lib.getExistencia());
            st.setDouble(4, lib.getPrecio_venta());
            int valor = st.executeUpdate();
            if (valor > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Libro insertado correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception ee) {
            msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + ee.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public LibroVenta recuperarPorID(int id) throws Exception {
        LibroVenta lv = null;//objeto a retornar
        try {
            this.conectar();
            String q = "select libv.id_libro,libv.reg_libroVenta,lib.titulo,libv.precio_venta,libv.stock\n"
                    + "from dblibroventa libv\n"
                    + "inner join dblibro lib on lib.id_libro = libv.id_libro \n"
                    + "where lib.id_libro=?";//busca el libro en la bd por id
            PreparedStatement st = this.getConector().prepareStatement(q);
            st.setInt(1, id);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                lv = new LibroVenta();
                Libro li = new Libro();
                lv.setReg_libroVenta(rt.getInt("libv.reg_libroVenta"));
                li.setId_libro(rt.getInt("libv.id_libro"));
                li.setTitulo(rt.getString("lib.titulo"));
                lv.setLibro(li);
                lv.setStock(rt.getInt("libv.stock"));
                lv.setPrecio_venta(rt.getDouble("libv.precio_venta"));
            }

        } catch (Exception e) {
            System.out.println("Error lib-dao " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lv;//retornar los datos recuperados
    }

}
