/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Autor;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Gustavo
 */
public class AutorDAO extends Conexion{
    public ArrayList<Autor> listaAutores() throws Exception{
        ArrayList<Autor> lista = new ArrayList<>();
        try {
            this.conectar();
            String q="call spListaAutores()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while(rt.next()){
                Autor aut = new Autor();
                aut.setId_autor(rt.getInt("id_autor"));
                aut.setNombre(rt.getString("nombre"));
                aut.setApellido(rt.getString("apellido"));
                lista.add(aut);
            }
        } catch (Exception e) {
            System.out.println("Error aut-dao "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
    /*Elimina Autor*/
    public String Eliminar(int id)throws Exception{
        String msj = "";        
        try {
            this.conectar();
            String query ="delete from dbAutor where id_autor=?";
             PreparedStatement smt = this.getConector().prepareStatement(query);
             smt.setInt(1, id);
             int valor = smt.executeUpdate();
            if(valor > 0){
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Datos eliminados correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception ee) {
           msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + ee.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        }finally{
            this.desconectar();
        }
        return msj;
    }
    
    /*Actualiza autor*/
     public String  actualizar(Autor a) throws Exception{
        String msj = "";
        try {
            this.conectar();
            String query = "Update dbAutor set nombre=?,apellido=?,pseudonimo=? where id_autor=?";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setString(1, a.getNombre());
            smt.setString(2, a.getApellido());
            smt.setString(3, a.getPseudonimo());
            smt.setInt(4, a.getId_autor());
            int valor = smt.executeUpdate();
            if(valor > 0){
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Autor actualizado Correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception ee) {
            msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + ee.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        }finally{
            this.desconectar();
        }
        return  msj;
     }
    
     /*Guarda Autor*/

     public String  guardar(Autor a) throws Exception{
        String msj = "";
        
        try {
            this.conectar();
            String query = "insert into dbAutor(nombre,apellido,pseudonimo) values (?,?,?)";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setString(1, a.getNombre());
            smt.setString(2, a.getApellido());
            smt.setString(3, a.getPseudonimo());
                        
            int valor = smt.executeUpdate();
            if(valor > 0){
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Autor insertado correctamente')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception ee) {
            msj = "$(document).ready(function () {\n"
                    + "              alertify.error('Algo salio mal..." + ee.getMessage() + "')\n"
                    + "            });";//manda msj de error mas el error detectado
        }finally{
            this.desconectar();
        }
        return  msj;
     }
     /*Llena Vista Autor*/
     public ArrayList<Autor> llenarAutor() throws Exception{
        ArrayList<Autor> lista = new ArrayList<Autor>();
        try {
            this.conectar();
            String query ="select id_autor,nombre,apellido,pseudonimo from dbAutor";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                Autor a = new Autor();
                a.setId_autor(rt.getInt("id_autor"));
                a.setNombre(rt.getString("nombre"));
                a.setApellido(rt.getString("apellido"));
                a.setPseudonimo(rt.getString("pseudonimo"));
                lista.add(a);      
            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        }finally{
            this.desconectar();
        }
            return lista;
    }
    
     
     /*Llena por ID de Autor*/
              
    public Autor llenarPorID(int id) throws Exception{
        Autor a = new Autor();
        try {
            this.conectar();
            String query ="select * from dbAutor where id_autor = ? ";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                a.setId_autor(rt.getInt("id_autor"));
                a.setNombre(rt.getString("nombre"));
                a.setApellido(rt.getString("apellido"));
                a.setPseudonimo(rt.getString("pseudonimo"));
            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        }finally{
            this.desconectar();
        }
            return a;
    }
}
