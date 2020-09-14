<%-- 
    Document   : amortizacao-constante
    Created on : 9 de set de 2020, 09:09:25
    Author     : Vinicius Da Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aula Pupo - Amortização Constante</title>
        <link rel ="Stylesheet" type="text/css" href="Css_Amortizacao.css">
    </head>
    <body>
        <a href="index.jsp">Voltar</a>
      <div id="central">  
          <h1>Amortização Constante</h1>
        
            <form name="formAmortizConst" action="" method="post">
                <label>Valor do Financiamento(R$):</label>
                <input type="text" name="valor" size="12" maxlength="12" required pattern="[0-9]+$" >
                <label>Qant. de Parcelas:</label>
                <input type="number" name="MesesAmort" placeholder="2-36" min="2" max="36" placeholder="2-36" size="2" maxlength="2" required>
                <label>Taxa(%):</label>
                <input type="text" name="TaxAmort" id="inputidtaxConst" size="2" maxlength="2" placeholder="0,1-20" required pattern="[0-9]+$">
                <input type="submit" name="enviar" value ="enviar">
                </form>
            <%if (request.getParameter("valor") != null){%>
              
              <%
                double Pmt;
                double Pv = Float.parseFloat(request.getParameter("valor"));    
                int n = Integer.parseInt(request.getParameter("MesesAmort"));
                float t = Float.parseFloat(request.getParameter("TaxAmort"));
                double amortizacao = Pv/n ;
                t = t/100;
                             
              %>
              <%--Pmt  =  Pv /((Math.pow(1+t,n)-1)/(Math.pow(1+t,n)*t)); -- essa fórmula é para tabela é price - Agora temos que fazer a formula da trabela SAC --%>
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
                     <%--  fazer um for para a criação da tabela --%><%-- alterar formula para tabela SAC--%>
                   <% for (int i = 1; i<=n ; i++){ %>                                   
                       <tr>
                        <td> <%=i%> </td> 
                        <td> <%=String.format("%,.2f", amortizacao + (Pv*t))%> </td> <%-- prestação = Juros + amortização ---%>
                        <td> <%=String.format("%,.2f", amortizacao )%> </td> <%-- Amortização = saldo devedor / número de parcelas --- ela é constante--%>
                        <td> <%=String.format("%,.2f", Pv*t)%> </td> <%-- Juros =  saldo devedor * taxa de juros  --%>
                        <td> <%=String.format("%,.2f", Pv - amortizacao)%> </td> <%-- saldo devedor = saldodevedor - amortizacao--%>
                       </tr>                 
                   <% Pv = Pv - amortizacao ; }%>                 
              </table>              
            <%}%>     
       </div>
       <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
