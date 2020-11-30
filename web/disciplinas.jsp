<!DOCTYPE html>
<%@page import="Materia.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>
<%@page import ="java.util.ArrayList"%>

<% ArrayList<Disciplina> disciplinas = Disciplina.getList(); 



  if(request.getParameter("update") != null){
           
  
  }


%>

  
  
<html>
    <head>
        
        <title>Disciplinas</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    
    
    <body>
        <div align = "center">
        <h1>Disciplinas Cursadas Atualmente</h1>
        <div class="container">
            
           

        
            <form>

            <% 
                if(disciplinas != null){
                for (Disciplina disciplina : disciplinas ){%>
            
                <input value=" <%=disciplina.getNome()%>" type="text" name="nome" />
                <input value=" <%=disciplina.getEmenta()%>" type="text" name="ementa" />
                <input value=" <%=disciplina.getCiclo()%>" type="text" name="ciclo" />
                <input value=" <%=disciplina.getNota()%>" type="text" name="nota" />
                
                    
                        
                        <input type="hidden" name="nomeAntigo" value="disciplina.getNome()" />
                        
                        <input type="submit" name="update" value="modificar" />
                        <input type="submit" name="delete" value="delete" />
                    
                <%} }%>
            </form>
  
        </div>  
    </body>
</html>
