/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Gustavo
 */
public class Conexion {
    private static String bd ="bibliop";
    private static String usr="root";
    private static String pass="root";
    private static String url="jdbc:mysql://localhost:3306/"+bd+"?useSSL=false";
    private Connection conector;

    public Connection getConector() {
        return conector;
    }

    public void setConector(Connection conector) {
        this.conector = conector;
    }
    public void conectar() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        try {
            this.conector = DriverManager.getConnection(url,usr,pass);
            if(this.conector!=null){
                System.out.println("Conectado a: *"+bd+"* todo correcto");
            }
        } catch (Exception e) {
            System.out.println("Error al conectar... "+e.getMessage());
        }
    }
    public void desconectar()throws Exception{
        try {
            if(this.conector!=null){
                if(!this.conector.isClosed()){
                    this.conector.close();
                }
            }
        } catch (Exception e) {
            System.out.println("Fallo al desconectar..."+e.getMessage());
        }
    }
}
