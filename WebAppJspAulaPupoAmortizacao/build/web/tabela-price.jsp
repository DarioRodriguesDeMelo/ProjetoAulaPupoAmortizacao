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
        
        <form name="formTabPrice" action="" method="post"> <%-- action vazio significa que vamos receber os dados na própria página--%>
            <label>Valor do Financiamento:</label>
            <input type="text" name="valor" min="0.00" placeholder="Digite o valor" size="12" maxlength="12" mask="###.##">
            <!--<input type="number" min="0.00" max="999,999.99" step="0.01" placeholder="Digite o valor" size="10" maxlength="10"/> -->
            <label>Qant. de Parcelas:</label>
            <input type="number" name="MesesAmort" id="inputidMesesprice" min="2" max="36" placeholder="número de meses" size="2" maxlength="2">
            <label>Taxa:</label>
            <input type="text" name="TaxAmort" id="inputidtaxprice" placeholder="Taxa">
            <input type="submit" name="enviar" value ="enviar"/>
        </form>
        <%--  formula tabela price
              i = taxa  
              n = numero de meses
              Pv = valor do financiamento = valor presente
              Pmt = parcelamento - valor que vamos encontrar
        
              Pmt = Pv / ((((1+i)^n)-1)/(((1+i)^n)*1))
        
        --%>
            <%--incio do script jsp--%>
           <%
           String Pv = request.getParameter("valor");    
           String n = request.getParameter("MesesAmort");
           String i = request.getParameter("TaxAmort");
           
           if (i != null) {
           out.print(i);
           }
           %>
    </body>
</html>
