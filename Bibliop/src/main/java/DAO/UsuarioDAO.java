package DAO;

import Entity.*;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioDAO extends Conexion {

    public boolean validarUsr(Usuario usr) throws Exception{
        boolean pass = false;
        try {
            this.conectar();
            String q= "Select count(id_usr) as num from dbusuario  Where nickname=?";
            PreparedStatement st = this.getConector().prepareStatement(q);
            st.setString(1, usr.getNickname());
            ResultSet rt = st.executeQuery();
            int result = 0;
            while(rt.next()){
                result = rt.getInt("num");
            }
            if(result > 0){
                pass = true;
            }
        } catch (Exception e) {
            throw e;
        }finally{
            this.desconectar();
        }
        return pass;
    }
    
    public boolean validarPass(Usuario usr) throws Exception{
        boolean pass = false;
        try {
            this.conectar();
            String q= "Select count(id_usr) as num from dbusuario  Where clave=? ";
            PreparedStatement st = this.getConector().prepareStatement(q);
            st.setString(1, usr.getClave());
            ResultSet rt = st.executeQuery();
            int result = 0;
            while(rt.next()){
                result = rt.getInt("num");
            }
            if(result > 0){
                pass = true;
            }
        } catch (Exception e) {
            throw e;
        }finally{
            this.desconectar();
        }
        return pass;
    }
    
    public boolean validarUsrPass(Usuario usr) throws Exception{
        boolean pass = false;
        try {
            this.conectar();
            String q= "Select count(id_usr) as num from dbusuario  Where nickname=? and clave =?";
            PreparedStatement st = this.getConector().prepareStatement(q);
            st.setString(1, usr.getNickname());
            st.setString(2, usr.getClave());
            ResultSet rt = st.executeQuery();
            int result = 0;
            while(rt.next()){
                result = rt.getInt("num");
            }
            if(result > 0){
                pass = true;
            }
        } catch (Exception e) {
            throw e;
        }finally{
            this.desconectar();
        }
        return pass;
    }
    
    public Usuario llenarSesion(Usuario us) throws Exception{
        Usuario usr = new Usuario();
        try {
            this.conectar();
            String query = "call llenarSesion(?,?)";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setString(1, us.getNickname());
            cs.setString(2, us.getClave());
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Persona per = new Persona();
                Rol r = new Rol();
                usr.setNickname(rs.getString("u.nickname"));
                per.setNombre(rs.getString("p.nombre"));
                per.setApellido(rs.getString("p.apellido"));
                per.setCorreo(rs.getString("p.correo"));
                per.setTelefono(rs.getString("p.telefono"));
                per.setDireccion(rs.getString("p.direccion"));
                r.setRol(rs.getString("r.rol"));
                usr.setPersonadato(per);
                usr.setRoldato(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }finally{
        this.desconectar();
        }
        return usr;
    }
    
    //Create Usuarios 
    public String createUsuario(Usuario u) throws Exception {
        String msj="";
        try {
            this.conectar();
            String query = "call createUsuarioCliente(?, ?, ?, ?, ?, ?, ?, ?)";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setString(1, u.getPersonadato().getNombre());
            cs.setString(2, u.getPersonadato().getApellido());
            cs.setString(3, u.getPersonadato().getCorreo());
            cs.setString(4, u.getPersonadato().getTelefono());
            cs.setString(5, u.getPersonadato().getDireccion());
            cs.setString(6, u.getNickname());
            cs.setString(7, u.getClave());
            cs.setInt(8, u.getRoldato().getId_rol());
            int i = cs.executeUpdate();
            if (i > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Usuario Almacenado')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            e.printStackTrace();
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    //Read Usuarios
    public ArrayList<Usuario> readUsuario() throws Exception {
        ArrayList<Usuario> Lista = new ArrayList<Usuario>();
        try {
            this.conectar();
            String query = "call llenarUsuario();";
            CallableStatement cs = this.getConector().prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Usuario usr = new Usuario();
                Rol r = new Rol();
                Persona per = new Persona();
                usr.setId_usr(rs.getInt("u.id_usr"));
                per.setNombre(rs.getString("p.nombre"));
                per.setApellido(rs.getString("p.apellido"));
                usr.setNickname(rs.getString("u.nickname"));
                r.setRol(rs.getString("r.rol"));
                per.setCorreo(rs.getString("p.correo"));
                per.setTelefono(rs.getString("p.telefono"));
                per.setDireccion(rs.getString("p.direccion"));
                usr.setPersonadato(per);
                usr.setRoldato(r);
                Lista.add(usr);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return Lista;
    }

    //Update Usuario
    public String updateUsuario(Usuario u) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "call actualizarUsuario(?, ?, ?)";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setInt(1, u.getId_usr());
            cs.setString(2, u.getNickname());
            cs.setString(3, u.getClave());
            int i = cs.executeUpdate();
            if (i > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Usuario actualizado')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            e.printStackTrace();
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    //Delete Usuario
    public String deleteUsuario(int id) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "call eliminarUsuario(?);";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setInt(1, id);
            int i = cs.executeUpdate();
            if (i > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Persona y usuario eliminados')\n"
                        + "});";//crea el msj de confirmación de exito
            }
        } catch (Exception e) {
            e.printStackTrace();
            msj = "$(document).ready(function () {\n" +
"              alertify.error('Algo salio mal..."+e.getMessage()+"')\n" +
"            });";//manda msj de error mas el error detectado
        } finally {
            this.desconectar();
        }
        return msj;
    }

    //Llenar por ID
    public Usuario readUsuarioID(int id) throws Exception {
        Usuario usr = new Usuario();
        Persona per = new Persona();
        try {
            this.conectar();
            String query = "call llenarUsuarioID(?)";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                usr.setId_usr(rs.getInt("u.id_usr"));
                usr.setNickname(rs.getString("u.nickname"));
                usr.setClave(rs.getString("u.clave"));
                per.setNombre(rs.getString("p.nombre"));
                per.setApellido(rs.getString("p.apellido"));
                per.setCorreo(rs.getString("p.correo"));
                per.setTelefono(rs.getString("p.telefono"));
                per.setDireccion(rs.getString("p.direccion"));
                usr.setPersonadato(per);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }finally{
        this.desconectar();
        }
        return usr;
    }
}
