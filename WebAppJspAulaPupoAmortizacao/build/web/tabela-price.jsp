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
            <input type="text" name="valor" min="100.00" placeholder="0.000.000,00" size="12" maxlength="12" required>
            <!--<input type="number" min="0.00" max="999,999.99" step="0.01" placeholder="Digite o valor" size="10" maxlength="10"/> -->
            <label>Qant. de Parcelas:</label>
            <input type="number" name="MesesAmort" id="inputidMesesprice" min="2" max="36" placeholder="2-36 m" size="2" maxlength="2" required>
            <label>Taxa(%):</label>
            <input type="text" name="TaxAmort" id="inputidtaxprice" size="2" maxlength="2" placeholder="0,1-20" required>
            <input type="submit" name="enviar" value ="enviar">
        </form>
        <%--  formula tabela price
              i = taxa  
              n = numero de meses
              Pv = valor do financiamento = valor presente
              Pmt = parcelamento - valor que vamos encontrar
        
              Pmt = Pv / ((((1+i)^n)-1)/(((1+i)^n)*i))
              teste passandoa formula pra java
              fazendo o cálculo por etapas
              Pmt  =  Pv /((Math.pow(1+i,n)-1)/(Math.pow(1+i,n)*i))
        --%>
            <%--incio do scriptlet jsp --%>
           
           
            <%if (request.getParameter("valor") != null){%>
              
              <%
              double Pmt;
              float Pv = Float.parseFloat(request.getParameter("valor"));    
              int n = Integer.parseInt(request.getParameter("MesesAmort"));
              float i = Float.parseFloat(request.getParameter("TaxAmort"));
              Pmt  =  Pv /((Math.pow(1+i,n)-1)/(Math.pow(1+i,n)*i));
              
              out.println(String.format("%10.2f", Pmt));
              
              
              
	      
              %>
              <%--  mostrar formatação de número só com duas casas decimais --%>
              <h2><%= String.format("%10.2f", Pmt) %></h2>
              
              <%--  fazer um for para a criação da tabela --%>
              
              
              
              
              
              
            <%}%>  
             
           
           
           
            
            
           
           
                   
           
           
           
           
          
           
           
           
    </body>
</html>
