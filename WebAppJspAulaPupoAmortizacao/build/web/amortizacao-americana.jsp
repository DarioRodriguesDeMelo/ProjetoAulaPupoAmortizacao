<%-- 
    Document   : amortizacao-americana
    Created on : 9 de set de 2020, 09:09:51
    Author     : Dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula Pupo - Amortização Constante</title>
    </head>
    <body>
        <a href="index.jsp">Voltar</a>
        <h1>Amortização Americana</h1>
        
        <form name="formAmortizAmerica" action="" method="post">
            
            <input type="text" name="valor" placeholder="Digite o valor">
            <input type="text" name="mesesAmortAmerica" placeholder="quantos meses">
            <input type="text" name="TaxAmortAmerica" id="inputidtaxAmerica" placeholder="Taxa">
            <input type="submit" name="enviar" value ="enviar"/>
            
            
        </form>
        
    </body>
</html>
