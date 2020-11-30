/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Materia;

import java.sql.*;
import java.util.ArrayList;
import web.DBListener;
/**
 *
 * @author ariaz
 */
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
    
    
    public  static void deletedDisciplina(String nome) throws Exception{
    ArrayList<Disciplina> list = new  ArrayList();
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome = ?");
            stmt.setString(1, nome);
            stmt.execute();
            
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
    
    }
    
    public static void update(String nomeAntigo, String nome, String ementa, int ciclo, double nota) throws Exception {
        ArrayList<Disciplina> list = new  ArrayList();
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("UPDATE disciplinas SET nome = ?, ementa = ?, ciclo = ?, nota = ? WHERE nome = ?");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            stmt.setDouble(4, nota);
            stmt.setString(5, nomeAntigo);
            stmt.execute();
            
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
    }
    
    public static void addDisciplina(String nome, String ementa, int ciclo, double nota) throws Exception { 
        
       ArrayList<Disciplina> list = new  ArrayList();
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("INSERT INTO disciplinas VALUES(?,?,?,?)");
            stmt.setString(1, nome);
            stmt.setString(2, ementa);
            stmt.setInt(3, ciclo);
            stmt.setDouble(4, nota);
            stmt.execute();
            
            
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex2){}
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
        if(methodException!=null) throw methodException;
   
    }
    
    public static ArrayList getList() throws Exception{
       ArrayList<Disciplina> list = new  ArrayList();
        Connection con = null; 
        PreparedStatement stmt = null; 
        ResultSet rs = null;
        Exception methodException = null;
        try{
            con = DBListener.getConnection();
            stmt = con.prepareStatement("SELECT * FROM disciplinas");
            
            rs = stmt.executeQuery();
            while(rs.next()){
                list.add(new Disciplina(
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
        if(methodException!=null) throw methodException;
        
        
        return list;
    }
    
    
      public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS disciplinas("
                + "nome VARCHAR(50) UNIQUE NOT NULL,"
                + "ementa VARCHAR(200) NOT NULL,"
                + "ciclo int,"
                + "nota double"
                + ")";
    }
    
}
