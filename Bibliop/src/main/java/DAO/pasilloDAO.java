package DAO;

import Entity.Pasillo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class pasilloDAO extends Conexion {

    public String guardarPasillo(Pasillo p) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "insert into dbPasillo (pasillo) values (?)";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setString(1, p.getPasillo());
            int valor = smt.executeUpdate();
            if (valor > 0) {
                msj = "Datos Guardados con Exito";
            } else {
                msj = "Error al Insertar Datos";
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public ArrayList<Pasillo> listaPasillos() throws Exception{
        ArrayList<Pasillo> lista = new ArrayList<>();
        try {
            this.conectar();
            String query = "select * from dbPasillo;";
            PreparedStatement smt = getConector().prepareStatement(query);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                Pasillo p = new Pasillo();
                p.setId_pasillo(rt.getString("id_pasillo"));
                p.setPasillo(rt.getString("pasillo"));
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error pasillo:" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public void EliminarPasillo(int id) throws Exception {
        try {
            this.conectar();
            String query = "delete from dbPasillo where id_pasillo=?";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, id);
            smt.executeUpdate();
        } catch (Exception y) {
            throw y;
        } finally {
            this.desconectar();
        }
    }

    public Pasillo LlenarPorID(int id) throws Exception {
        Pasillo p = new Pasillo();
        try {
            this.conectar();
            String query = "select * from id_pasillo where dbPasillo=?";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                p.setId_pasillo(rt.getString("id_pasillo"));
                p.setPasillo(rt.getString("pasillo"));
            }
        } catch (Exception a) {
            throw a;
        } finally {
            this.desconectar();
        }
        return p;
    }

    public void Actualizar(Pasillo pa) throws Exception {
        try {
            this.conectar();
            String query = "update dbPasillo set id_pasillo=?, pasillo=? where id_Pasillo=?;";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setString(1, pa.getId_pasillo());
            smt.setString(2, pa.getPasillo());
            smt.setString(3, pa.getId_pasillo());

        } catch (Exception x) {
            System.out.println("Error " + x.getMessage());
        } finally {
            this.desconectar();
        }
    }
}
