package DAO;

import Entity.Persona;
import Entity.Usuario;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;

public class PersonaDAO extends Conexion {
    //Read
    public ArrayList<Persona> readPersona() throws Exception {
        ArrayList<Persona> lista = new ArrayList<Persona>();
        try {
            this.conectar();
            String query = "SELECT * FROM dbpersona";
            PreparedStatement ps = this.getConector().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Persona p = new Persona();
                p.setId_persona(rs.getInt("id_persona"));
                p.setNombre(rs.getString("nombre"));
                p.setApellido(rs.getString("apellido"));
                p.setCorreo(rs.getString("correo"));
                p.setTelefono(rs.getString("telefono"));
                p.setDireccion(rs.getString("direccion"));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    //Llenar un solo ID
    public Persona llenarPersonaID(int id) throws Exception {
        Persona p = new Persona();
        try {
            this.conectar();
            String query = "SELECT * FROM dbpersona where id_persona = ?";
            PreparedStatement ps = this.getConector().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p.setId_persona(rs.getInt("id_persona"));
                p.setNombre(rs.getString("nombre"));
                p.setApellido(rs.getString("apellido"));
                p.setCorreo(rs.getString("correo"));
                p.setTelefono(rs.getString("telefono"));
                p.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return p;
    }
    
     public String updatePersona(Persona p) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "call actualizarPersona(?, ?, ?, ?, ?, ?)";
            CallableStatement cs = this.getConector().prepareCall(query);
            cs.setInt(1, p.getId_persona());
            cs.setString(2, p.getNombre());
            cs.setString(3, p.getApellido());
            cs.setString(4, p.getCorreo());
            cs.setString(5, p.getTelefono());
            cs.setString(6, p.getDireccion());
            int i = cs.executeUpdate();
            if (i > 0) {
                msj = "$(document).ready(function () {\n"
                        + "alertify.success('Datos personales actualizados')\n"
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
}
