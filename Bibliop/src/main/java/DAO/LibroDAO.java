/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class LibroDAO extends Conexion {

    public ArrayList<Libro> listaLibros() throws Exception {
        ArrayList<Libro> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "call spListaLibro()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                Libro lib = new Libro();
                Genero gen = new Genero();
                Autor aut = new Autor();
                Editorial edi = new Editorial();
                Estante est = new Estante();
                Pasillo pas = new Pasillo();
                lib.setId_libro(rt.getInt("lib.id_libro"));
                lib.setTitulo(rt.getString("lib.titulo"));
                lib.setSinopsis(rt.getString("lib.sinopsis"));
                lib.setPortada(rt.getString("lib.portada"));
                lib.setCosto(rt.getDouble("lib.costo"));
                gen.setGenero(rt.getString("gen.genero"));
                aut.setNombre(rt.getString("aut.nombre"));
                aut.setApellido(rt.getString("aut.apellido"));
                edi.setEditorial(rt.getString("edi.editorial"));
                pas.setId_pasillo(rt.getString("pas.id_pasillo"));
                est.setNumero_estante(rt.getInt("est.numero_estante"));
                est.setPasillo(pas);
                lib.setAutor(aut);
                lib.setGenero(gen);
                lib.setEditorial(edi);
                lib.setEstante(est);
                lista.add(lib);
            }
        } catch (Exception e) {
            System.out.println("Error lib-dao.. " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public String guardarInfoLibro(Libro lib) throws Exception {
        String msj = "";
        try {
            this.conectar();//conectar a la bd
            String q = "call spGuardarInfoLibro(?,?,?,?,?,?,?,?)";//llamar procedimiento almacenado
            CallableStatement st = this.getConector().prepareCall(q);//Preparar el llamado de la sentencia
            //insertar parametros (datos del libro a guardar)
            st.setString(1, lib.getTitulo());
            st.setInt(2, lib.getAutor().getId_autor());
            st.setInt(3, lib.getEditorial().getId_editorial());
            st.setInt(4, lib.getGenero().getId_genero());
            st.setString(5, lib.getSinopsis());
            st.setString(6, lib.getPortada());
            st.setDouble(7, lib.getCosto());
            st.setInt(8, lib.getEstante().getId_estante());
            //fin de la inserción de parametros
            int res = st.executeUpdate();//guarda el nuevo libro
            if (res > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Libro almacenado con exito')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public String subirImagen(Libro lib) throws Exception {
        String msj = "";//msj de error
        try {
            this.conectar();
            String q = "call spGuardarImagen(?,?)";//actualiza la portada en la bd
            CallableStatement st = this.getConector().prepareCall(q);
            st.setInt(1, lib.getId_libro());// id del libro a colocar portada
            st.setString(2, lib.getPortada());//ruta de la nueva portada ya subida
            int res = st.executeUpdate();
            if (res > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Portada subida con exito')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public Libro recuperarPorID(int id_l) throws Exception {
        Libro lib = new Libro();//objeto a retornar
        try {
            this.conectar();
            String q = "call spRecuperarLibro(?)";//busca el libro en la bd por id
            CallableStatement st = this.getConector().prepareCall(q);
            st.setInt(1, id_l);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                //objetos necesarios para llenar el objeto a retornar
                Autor aut = new Autor();
                Genero gen = new Genero();
                Editorial edi = new Editorial();
                Estante est = new Estante();
                //recupera datos de la bd que llena en rt(ResultSet)
                lib.setId_libro(rt.getInt("id_libro"));
                lib.setTitulo(rt.getString("titulo"));
                aut.setId_autor(rt.getInt("id_autor"));
                gen.setId_genero(rt.getInt("id_genero"));
                edi.setId_editorial(rt.getInt("id_editorial"));
                est.setId_estante(rt.getInt("id_estante"));
                lib.setSinopsis(rt.getString("sinopsis"));
                lib.setCosto(rt.getDouble("costo"));
                //lenado de llaves foraneas
                lib.setAutor(aut);
                lib.setEditorial(edi);
                lib.setGenero(gen);
                lib.setEstante(est);
            }
        } catch (Exception e) {
            System.out.println("Error lib-dao " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lib;//retornar los datos recuperados
    }

    public String actualizarLibro(Libro lib) throws Exception {
        String msj = "Algo salio mal... ";
        try {
            this.conectar();
            String q = "call bibliop.spActualizarLibro(?,?,?,?,?,?,?,?);";
            CallableStatement st = this.getConector().prepareCall(q);
            st.setInt(1, lib.getId_libro());
            st.setString(2, lib.getTitulo());
            st.setInt(3, lib.getAutor().getId_autor());
            st.setInt(4, lib.getEditorial().getId_editorial());
            st.setInt(5, lib.getGenero().getId_genero());
            st.setString(6, lib.getSinopsis());
            st.setDouble(7, lib.getCosto());
            st.setInt(8, lib.getEstante().getId_estante());
            int res = st.executeUpdate();
            if (res > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Libro actualizado con exito')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public String eliminarLibro(int id) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String q = "call spEliminarLibro(?)";
            CallableStatement st = this.getConector().prepareCall(q);
            st.setInt(1, id);
            int res = st.executeUpdate();
            if (res > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Libro eliminado con exito')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
           msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }
}
