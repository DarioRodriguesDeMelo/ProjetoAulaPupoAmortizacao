<%-- 
    Document   : tabela-price
    Created on : 9 de set de 2020, 09:11:09
    Author     : Dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula Pupo - Tabela Price</title>
    </head>
    <body>
        <a href="index.jsp">Voltar</a>
        <h1>Tabela Price</h1>
        
        <form name="formTabPrice" action="index.jsp" method="post">
            <label>Valor do Financiamento</label><br/>
            <input type="text" name="valor" min="0.00" placeholder="Digite o valor" size="10" maxlength="10">
            <!--<input type="number" min="0.00" max="999,999.99" step="0.01" placeholder="Digite o valor" size="10" maxlength="10"/> -->
            
            <input type="text" name="mesesAmort" id="inputidMesesprice" placeholder="número de meses">
            <input type="text" name="TaxAmort" id="inputidtaxprice" placeholder="Taxa">
            <input type="submit"
        </form>
        
    </body>
</html>
