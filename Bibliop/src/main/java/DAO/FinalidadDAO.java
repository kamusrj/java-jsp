/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Entity.Finalidad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gustavo
 */
public class FinalidadDAO extends Conexion{
    public ArrayList<Finalidad> listaFinalidad() throws Exception{
        ArrayList<Finalidad> lista = new ArrayList<>();
        try {
            this.conectar();
            String q = "select * from dbfinalidad;";
            PreparedStatement st = this.getConector().prepareStatement(q);
            ResultSet rt = st.executeQuery();
            while(rt.next()){
                Finalidad fin = new Finalidad();
                fin.setId_finalidad(rt.getInt("id_finalidad"));
                fin.setFinalidad(rt.getString("finalidad"));
                lista.add(fin);
            }
        } catch (Exception e) {
            System.out.println("Error finDAO "+e.getMessage());
            throw e;
        }finally{
            this.desconectar();
        }
        return lista;
    }
}
