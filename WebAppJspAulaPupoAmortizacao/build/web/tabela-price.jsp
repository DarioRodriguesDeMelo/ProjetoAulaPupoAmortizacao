<%-- 
    Document   : tabela-price
    Created on : 9 de set de 2020, 09:11:09
    Author     : Dario e Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula Pupo - Tabela Price</title>       
        <link rel ="Stylesheet" type="text/css" href="Css_Amortizacao.css">
    </head>
    <body>
       
       
       <div id="central">
           <%@include file="WEB-INF/jspf/menu.jspf" %>
           <h1>Tabela Price</h1>
        
            <form name="formTabPrice" action="" method="post"> <%-- action vazio significa que vamos receber os dados na própria página--%>
               <label>Valor do Financiamento(R$):</label>
               <input type="text" name="valor" min="100.00"  size="12" maxlength="12" required pattern="[0-9]+$">
               <!--<input type="number" min="0.00" max="999,999.99" step="0.01" placeholder="Digite o valor" size="10" maxlength="10"/> -->
               <label>Qant. de Parcelas:</label>
               <input type="number" name="MesesAmort" id="inputidMesesprice" min="2" max="36" placeholder="2-36 m" size="2" maxlength="2" required >
               <label>Taxa(%):</label>
               <input type="text" name="TaxAmort" id="inputidtaxprice" size="2" maxlength="2" placeholder="0,1-20" required pattern="[0-9]+$" >
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
                double Pv = Float.parseFloat(request.getParameter("valor"));    
                int n = Integer.parseInt(request.getParameter("MesesAmort"));
                float t = Float.parseFloat(request.getParameter("TaxAmort"));
                t = t/100;
                Pmt  =  Pv /((Math.pow(1+t,n)-1)/(Math.pow(1+t,n)*t));             
              %>
              <%--  mostrar formatação de número só com duas casas decimais 
              <h2><%= String.format("%,.2f", Pmt) %></h2> --%>
              <br/>
              <h4>Para um financiamento de R$  <%= String.format("%,.2f", Pv)  %> parcelados em <%= n %> vezes com taxa de <%= t*100 %> % ao mês</4>
                  <hr/><br/>
              <table border="1">  <%-- criacao da tabela price --%>
                  <tr>
                   <th> N </th>
                   <th>Prestação</th>
                   <th>Amortização</th>
                   <th>Juros</th>
                   <th>Saldo Devedor</th>
                  </tr>
                  <tr>
                      <td> 0 </td>
                      <td> ---- </td>
                      <td> ---- </td>
                      <td> ---- </td>
                      <td> <%= String.format("%,.2f", Pv)%> </td>                     
                  </tr>
                     <%--  fazer um for para a criação da tabela --%>
                   <% for (int i = 1; i<=n ; i++){ %>                                   
                       <tr>
                        <td> <%=i%> </td> 
                        <td> <%=String.format("%,.2f", Pmt)%> </td> <%-- valor da parcela essa é fixa certo ---%>
                        <td> <%=String.format("%,.2f", Pmt - (Pv*t))%> </td> <%-- Amortização= saldo devedor - juros --%>
                        <td> <%=String.format("%,.2f", Pv*t)%> </td> <%-- Juros =  saldo devedor * taxa de juros  --%>
                        <td> <%=String.format("%,.2f", Pv -(Pmt -(Pv*t)))%> </td> <%-- saldo devedor= saldodevedor - amortizacao--%>
                       </tr>                 
                   <% Pv = Pv -(Pmt -(Pv*t)) ; }%>                 
              </table>              
            <%}%> 
        <%@include file="WEB-INF/jspf/rodape.jspf" %>    
       </div> 
       
       
    </body>
</html>
