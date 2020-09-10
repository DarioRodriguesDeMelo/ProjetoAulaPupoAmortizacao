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
            <label>Valor do Financiamento(R$):</label>
            <input type="text" name="valor" min="100.00" placeholder="Digite o valor" size="12" maxlength="12" mask="###.##" pattern="\d{3}\.\d{3}\.\d{3}\,\d{2}" />
            <!--<input type="number" min="0.00" max="999,999.99" step="0.01" placeholder="Digite o valor" size="10" maxlength="10"/> -->
            <label>Qant. de Parcelas:</label>
            <input type="number" name="MesesAmort" id="inputidMesesprice" min="2" max="36" placeholder="2-36" size="2" maxlength="2">
            <label>Taxa(%):</label>
            <input type="text" name="TaxAmort" id="inputidtaxprice" placeholder="Taxa" size="2" maxlength="2">
            <input type="submit" name="enviar" value ="enviar"/>
        </form>
        <%--  formula tabela price
              i = taxa  
              n = numero de meses
              Pv = valor do financiamento = valor presente
              Pmt = parcelamento - valor que vamos encontrar
        
              Pmt = Pv / ((((1+i)^n)-1)/(((1+i)^n)*1))
        
        --%>
            <%--incio do scriptlet jsp--%>
           <%
           
            if (request.getParameter("valor") == null){
            
            } else { 
             
           float Pmt;
           float Pv = Float.parseFloat(request.getParameter("valor"));    
           int n = Integer.parseInt(request.getParameter("MesesAmort"));
           float i = Float.parseFloat(request.getParameter("TaxAmort"));
            }
           
           
           
                   
           
           %>
           <%--if (i != 0) {
             out.print(i);
           }--%>
           
    </body>
</html>
