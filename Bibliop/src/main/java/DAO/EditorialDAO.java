/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Editorial;
import Entity.Genero;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class EditorialDAO extends Conexion {

    public ArrayList<Editorial> listaEditorial() throws Exception {
        ArrayList<Editorial> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "call spListaEditorial()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while (rt.next()) {
                Editorial edi = new Editorial();
                edi.setId_editorial(rt.getInt("id_editorial"));
                edi.setEditorial(rt.getString("editorial"));
                lista.add(edi);
            }
        } catch (Exception e) {
            System.out.println("Error edi-dao " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public String ActualizarEditorial(Editorial ed) throws Exception {

        String msj = "";
        try {
            this.conectar();
            String query = " update dbeditorial set editorial = ? where id_editorial = ?;";
            PreparedStatement stm = this.getConector().prepareStatement(query);
            stm.setString(1, ed.getEditorial());
            stm.setInt(2, ed.getId_editorial());

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
    public String EliminarEditorial(int id) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "delete from dbeditorial where id_editorial = ?;";
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
    public String InsertarEditorial(Editorial ed) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "insert into dbeditorial (editorial) value (?);";
            PreparedStatement stm = this.getConector().prepareStatement(query);
            stm.setString(1, ed.getEditorial());
            int valor = stm.executeUpdate();
            if (valor > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Editorial creada')\n"
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
    public ArrayList<Editorial> llenarEditorial() throws Exception {
        ArrayList<Editorial> lista = new ArrayList<Editorial>();
        try {
            this.conectar();
            String Query = "SELECT id_editorial,editorial FROM dbeditorial;";
            PreparedStatement smt = this.getConector().prepareStatement(Query);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                Editorial e = new Editorial();
                e.setId_editorial(rt.getInt("id_editorial"));
                e.setEditorial(rt.getString("editorial"));
                lista.add(e);

            }
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            this.desconectar();
        }
        return lista;
    }

    /*Editar datos*/
    public Editorial EditarIdEditorial(int id) throws Exception {
        Editorial e = new Editorial();
        try {
            this.conectar();
            String Query = "SELECT * FROM dbeditorial where id_editorial = ?;";
            PreparedStatement smt = this.getConector().prepareStatement(Query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                e.setId_editorial(rt.getInt("id_editorial"));
                e.setEditorial(rt.getString("editorial"));

            }
        } catch (Exception ee) {
            ee.printStackTrace();

        } finally {
            this.desconectar();
        }
        return e;
    }
}
