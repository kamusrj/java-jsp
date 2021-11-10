/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Estante;
import Entity.Genero;
import Entity.Pasillo;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class EstanteDAO extends Conexion{
    
    public ArrayList<Estante> listaEstante() throws Exception{
        ArrayList<Estante> lista = new ArrayList<>();
        try {
            this.conectar();
            String q="call spListaEstante()";
            CallableStatement st = this.getConector().prepareCall(q);
            ResultSet rt = st.executeQuery();
            while(rt.next()){
                Estante est = new Estante();
                Pasillo pas = new Pasillo();
                est.setId_estante(rt.getInt("est.id_estante"));
                est.setNumero_estante(rt.getInt("est.numero_estante"));
                pas.setId_pasillo(rt.getString("pas.id_pasillo"));
                pas.setPasillo(rt.getString("pas.pasillo"));
                est.setPasillo(pas);
                lista.add(est);
            }
        } catch (Exception e) {
            System.out.println("Error est-dao "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return lista;
    }
    public String guardarEstante(Estante e) throws Exception {
        String msj = "";
        try {
            this.conectar();
            String query = "insert into dbEstante (id_estante, nunmero_estante, id_pasillo) values (?,?,?)";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, e.getId_estante());
            smt.setInt(2, e.getNumero_estante());
            smt.setString(3, e.getPasillo().getId_pasillo());
            int valor = smt.executeUpdate();
            if (valor > 0) {
                msj = "Datos Guardados con Exito";
            } else {
                msj = "Error al Insertar Datos";
            }
        } catch (Exception ee) {
            System.out.println("Error " + ee.getMessage());
        } finally {
            this.desconectar();
        }
        return msj;
    }

    public ArrayList<Estante> LlenarEstante() throws Exception {
        ArrayList<Estante> lista = new ArrayList<Estante>();
        try {
            this.conectar();
            String query = "select e.id_estante, e.numero_estante, p.pasillo\n"
                    + "from dbEstante e\n"
                    + "inner join dbPasillo p on e.id_pasillo = p.id_pasillo;";
            PreparedStatement smt = getConector().prepareStatement(query);
            ResultSet rt = smt.executeQuery();
            while(rt.next()){
                Estante e = new Estante();
                Pasillo p = new Pasillo();
                e.setId_estante(rt.getInt("e.id_estante"));
                e.setNumero_estante(rt.getInt("e.numero_estante"));
                p.setId_pasillo(rt.getString("p.pasillo"));
                e.setPasillo(p);
                lista.add(e);
            }
            
        } catch (Exception e) {
            System.out.println("Error estante:" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public void EliminarEstante(int id) throws Exception {
        try {
            this.conectar();
            String query = "delete from dbEstante where id_Estante=?";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, id);
            smt.executeUpdate();
        } catch (Exception y) {
            throw y;
        } finally {
            this.desconectar();
        }
    }

    public Estante LlenarPorID(int id) throws Exception {
        Estante e = new Estante();
        try {
            this.conectar();
            String query = "select * from id_estante where dbEstante=?";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, id);
            ResultSet rt = smt.executeQuery();
            while (rt.next()) {
                Pasillo p = new Pasillo();
                e.setId_estante(rt.getInt("id_estante"));
                e.setNumero_estante(rt.getInt("numero_estante"));
                p.setId_pasillo(rt.getString("id_pasillo"));
                e.setPasillo(p);
            }
        } catch (Exception a) {
            throw a;
        } finally {
            this.desconectar();
        }
        return e;
    
    }

    public void Actualizar(Estante es) throws Exception {
        try {
            this.conectar();
            String query = "update dboempleado set id_estante=?, numero_estante=?, id_pasillo=? where id_estante=?;";
            PreparedStatement smt = this.getConector().prepareStatement(query);
            smt.setInt(1, es.getId_estante());
            smt.setInt(2, es.getNumero_estante());
            smt.setString(3, es.getPasillo().getId_pasillo());
            smt.setInt(4, es.getId_estante());

        } catch (Exception x) {
            System.out.println("Error " + x.getMessage());
        } finally {
            this.desconectar();
        }
    }
}
