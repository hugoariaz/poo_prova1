<!DOCTYPE html>
<%@page import="Materia.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>
<%@page import ="java.util.ArrayList"%>>

<% ArrayList<Disciplina> disciplinas = Disciplina.getList(); 


   if(request.getParameter("add") != null ){
      String nome = request.getParameter("nome");
      String ementa = request.getParameter("ementa");
      int ciclo = Integer.parseInt(request.getParameter("ciclo"));
      
      double nota = Double.parseDouble(request.getParameter("nota"));
      
      Disciplina.addDisciplina(nome, ementa, ciclo, nota);
       
   }
   

   if(request.getParameter("delete") != null ){
      String nome = request.getParameter("nome");
      
      Disciplina.deletedDisciplina(nome);
       
   }
   


  if(request.getParameter("update") != null ){
      String nomeAntigo = request.getParameter("nomeAntigo");
      String nome = request.getParameter("nome");
      String ementa = request.getParameter("ementa");
      int ciclo = Integer.parseInt(request.getParameter("ciclo"));
      
      double nota = Double.parseDouble(request.getParameter("nota"));
      
      Disciplina.update(nomeAntigo,nome, ementa, ciclo, nota);
       
   }

%>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <div align = "center">
        <h1>Disciplinas Cursadas Atualmente</h1>
        <form>
            
            <input type="text" name="nome" />
            <input type="text" name="ementa" />
            <input type="text" name="ciclo" />
            <input type="text" name="nota" />
            <input type="submit" name="add" value="adicionar" />
        </form>
        <div class="container">
            
            
       
            <% 
                if(disciplinas != null){
                for (Disciplina disciplina : disciplinas ){%>
              <form>

            
            
                        <input type="text" name="nota" value="<%=disciplina.getNome()%>" />
                        <input type="text" name="ementa" value="<%=disciplina.getEmenta()%>" />
                        <input type="text" name="ciclo" value="<%=disciplina.getCiclo()%>" />
                        
                        <input type="text" name="nota" value="<%=disciplina.getNota()%>" />
                        <input type="hidden" name="nomeAntigo" value="<%=disciplina.getNome()%>" />
                        
                        <input type="submit" name="delete" value="excluir" />
                        <input type="submit" name="update" value="modificar" />

                    </form><!-- comment -->
                <!-- comment -->
                <%} }%>
           
      
        </div>  
    </body>
</html>
