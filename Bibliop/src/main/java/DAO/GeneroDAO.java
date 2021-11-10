/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Autor;
import Entity.Genero;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class GeneroDAO extends Conexion{
    public ArrayList<Genero> listaGenero() throws Exception{
        ArrayList<Genero> lista = new ArrayList<>();
        try {
            this.conectar();
            String q="call spListaGenero()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while(rt.next()){
                Genero gen = new Genero();
                gen.setId_genero(rt.getInt("id_genero"));
                gen.setGenero(rt.getString("genero"));
                lista.add(gen);
            }
        } catch (Exception e) {
            System.out.println("Error gen-dao "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
                            /*actualizar datos*/
    public String ActualizarGenero(Genero ge) throws Exception {

        String msj = "";
        try {
            this.conectar();
            String query = " update dbgenero set genero = ? where id_genero = ?;";
            PreparedStatement stm = this.getConector().prepareStatement(query);
            stm.setString(1, ge.getGenero());
            stm.setInt(2, ge.getId_genero());

            int valor = stm.executeUpdate();
            if (valor > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Datos actualizados correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
             msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + e.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        } finally {

            this.desconectar();
        }
        return msj;
    }

    /*Eliminar Datos*/
    public String EliminarGenero(int id) throws Exception {

        String msj = "";
        try {
            this.conectar();
            String query = "delete from dbgenero where id_genero = ?;";
            PreparedStatement stm = this.getConector().prepareStatement(query);
            stm.setInt(1, id);
            int valor = stm.executeUpdate();
            if (valor > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Datos eliminados correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
             msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + e.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        } finally {

            this.desconectar();
        }
        return msj;
    }

                           /*Mostrar insertar*/
    public String InsertarGenero(Genero ge) throws Exception {

        String msj = "";
        try {
            this.conectar();
            String query = "insert into dbgenero (genero) value (?);";
            PreparedStatement stm = this.getConector().prepareStatement(query);
            stm.setString(1, ge.getGenero());
            int valor = stm.executeUpdate();
            if (valor > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Genero insertado correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
             msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + e.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

                      /*Mostrar datos*/
    public ArrayList<Genero> llenarGenero() throws Exception {
        ArrayList<Genero> lista = new ArrayList<Genero>();
        try {
            this.conectar();
            String Query = "SELECT id_genero,genero FROM dbgenero;";
            PreparedStatement smt = this.getConector().prepareStatement(Query);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                Genero g = new Genero();
                g.setId_genero(rt.getInt("id_genero"));
                g.setGenero(rt.getString("genero"));
                lista.add(g);

            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            this.desconectar();
        }
        return lista;
    }

                          /*Editar datos*/
    public Genero EditarIdGenero(int id) throws Exception {
        Genero g = new Genero();
        try {
            this.conectar();
            String Query = "SELECT * FROM dbgenero where id_genero = ?;";
            PreparedStatement smt = this.getConector().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                g.setId_genero(rt.getInt("id_genero"));
                g.setGenero(rt.getString("genero"));

            }
        } catch (Exception ee) {
            ee.printStackTrace();

        } finally {
            this.desconectar();
        }
        return g;
    }
}
