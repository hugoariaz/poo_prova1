/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Materia;

import java.util.ArrayList;

/**
 *
 * @author ariaz
 */
import java.sql.*;
import web.DBListener;
public class Disciplina {
    private String nome;
    private String ementa;
    private int ciclo;
    private double nota;

    public Disciplina(String nome, String ementa, int ciclo, double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }

    public Disciplina() {
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public int getCiclo() {
        return ciclo;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(Float nota) {
        this.nota = nota;
    }
    
    public ArrayList getList(){
        ArrayList< Disciplina> disciplinas = new ArrayList<> ();
        
        
        Connection con = null;
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("SELECT * FROM usuarios WHERE login = ? and password_hash = ?");
           
            rs = stmt.executeQuery();
            while(rs.next()){
                disciplinas.add(new Disciplina(
                        rs.getString("nome"),
                        rs.getString("ementa"),
                        rs.getInt("ciclo"),
                        rs.getDouble("nota")
                ));
            }
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }

        
        return disciplinas;
    }
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplnas("
                + "nome VARCHAR(50) UNIQUE NOT NULL,"
                + "ementa VARCHAR(200) NOT NULL,"
                + "ciclo int,"
                + "nota double"
                + ")";
    }
    
    
    
}
