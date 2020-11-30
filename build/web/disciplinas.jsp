<!DOCTYPE html>
<%@page import="Materia.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>
<%@page import ="java.util.ArrayList"%>>

<% ArrayList<Disciplina> disciplinas = (ArrayList) application.getAttribute ("Disciplinas"); %>

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
        <div class="container">
            
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Ementa</th>
                        <th>Ciclo</th>
                        <th>Nota</th>
                    </tr>  
        </thead>
        <tbody>
            <% 
                if(disciplinas != null){
                for (Disciplina disciplina : disciplinas ){%>
            
            
            <tr><td><%=disciplina.getNome()%></td>
                <td><%=disciplina.getEmenta()%></td>
                <td><%=disciplina.getCiclo()%></td>
                <td>
                    <form>
                        <input type="test" name="nota" value="<%=disciplina.getNota()%>">
                        <input type="hidden" name="indice" value="" />
                        
                        <td><>input type="submit" name="enviar" value="modificar" /></td>
                    </form><!-- comment -->
                </td><!-- comment -->
                <%} }%>
            </<tr>
        </tbody>
        </table>
        </div>  
    </body>
</html>
