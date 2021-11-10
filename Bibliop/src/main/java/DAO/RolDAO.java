
package DAO;

import Entity.Rol;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RolDAO extends Conexion{
    //Read roles
    public ArrayList<Rol> readRol() throws Exception{
    ArrayList<Rol> Lista = new ArrayList<Rol>();
        try {
            this.conectar();
            String query = "select * from dbRol";
            PreparedStatement ps = this.getConector().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            Rol r = new Rol();
            r.setId_rol(rs.getInt("id_rol"));
            r.setRol(rs.getString("rol"));
            Lista.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Error: " + e.getMessage());
        }finally{
        this.desconectar();
        }
    return Lista;    
    }
}
