<%-- 
    Document   : index
    Created on : 8 de set de 2020, 18:37:35
    Author     : Dario e Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula Pupo-Amortização</title>
        <link rel ="Stylesheet" type="text/css" href="Css_Amortizacao.css">
    </head>
    <body>
       <Div id="central">  
         <%@include file="WEB-INF/jspf/menu.jspf" %>  
        <h1>Trabalho em JSP para Aula do Pupo</h1><br><br>
        
        <h2>Escolha um dos 3 tipos de financiamentos disponíveis<h2/><br/>
        <a href="amortizacao-americana.jsp">Amortização Americana</a><br>
        <a href="amortizacao-constante.jsp">Amortização Constante</a><br>
        <a href="tabela-price.jsp">Tabela Price</a><br><br/>
        <a href="home.jsp">Sobre o Projeto</a>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
       </div> 
       
    </body>
</html>
