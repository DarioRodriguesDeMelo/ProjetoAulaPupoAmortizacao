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
            <label>Valor do Financiamento(R$):</label>
            <input type="text" name="valor" placeholder="Digite o valor aqui" size="12" maxlength="12">
            <label>Qant. de Parcelas:</label>
            <input type="number" name="mesesAmortAmerica" placeholder="2-36"min="2" max="36" placeholder="2-36" size="2" maxlength="2">
            <label>Taxa(%):</label>
            <input type="text" name="TaxAmortAmerica" id="inputidtaxAmerica" size="2" maxlength="2" placeholder="0,1-20">
            <input type="submit" name="enviar" value ="enviar"/>
            
            
        </form>
        
    </body>
</html>
