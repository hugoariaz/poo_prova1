

<%@page import="Materia.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/menu.jspf"%>
<%@page import ="java.util.ArrayList"%>>
        
<%
    ArrayList<Disciplina> disciplinas = (ArrayList) application.getAttribute ("disciplinas");
    if (disciplinas == null) {
    disciplinas = new ArrayList ();
    
    application.setAttribute ("disciplinas", disciplinas);
    
    

    }
    
    %>
    
   


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    <body>
        <div align ="center">
           <h1>Prova 1  - POO</h1> 
           <br/> <br/> <br/> <hr/>
           <h3>Hugo Leonardo Ariaz Amador</h3>
           <h3>RA: 1290481913049</h3>
           

        </div>
        
    </body>
</html>
