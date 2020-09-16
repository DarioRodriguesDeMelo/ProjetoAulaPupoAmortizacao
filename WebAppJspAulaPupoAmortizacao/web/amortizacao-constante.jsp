<%-- 
    Document   : amortizacao-constante
    Created on : 9 de set de 2020, 09:09:25
    Author     : Vinicius Da Silva
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>
    <body>
        
      <div id="central"> 
          <%@include file="WEB-INF/jspf/menu.jspf" %>
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
              <%--Pmt  =  Pv /((Math.pow(1+t,n)-1)/(Math.pow(1+t,n)*t)); -- essa fï¿½rmula ï¿½ para tabela ï¿½ price - Agora temos que fazer a formula da trabela SAC --%>
              <%--  mostrar formataï¿½ï¿½o de nï¿½mero sï¿½ com duas casas decimais 
              <h2><%= String.format("%,.2f", Pmt) %></h2> --%>
              <br/>
              <h4>Para um financiamento de R$  <%= String.format("%,.2f", Pv)  %> parcelados em <%= n %> vezes com taxa de <%= t*100 %> % ao mï¿½s</4>
                  <hr/><br/>
              <table border="1">  <%-- criacao da tabela price --%>
                  <tr>
                   <th> N </th>
                   <th>Prestaï¿½ï¿½o</th>
                   <th>Amortizaï¿½ï¿½o</th>
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
                     <%--  fazer um for para a criaï¿½ï¿½o da tabela --%><%-- alterar formula para tabela SAC--%>
                   <% for (int i = 1; i<=n ; i++){ %>                                   
                       <tr>
                        <td> <%=i%> </td> 
                        <td> <%=String.format("%,.2f", amortizacao + (Pv*t))%> </td> <%-- prestaï¿½ï¿½o = Juros + amortizaï¿½ï¿½o ---%>
                        <td> <%=String.format("%,.2f", amortizacao )%> </td> <%-- Amortizaï¿½ï¿½o = saldo devedor / nï¿½mero de parcelas --- ela ï¿½ constante--%>
                        <td> <%=String.format("%,.2f", Pv*t)%> </td> <%-- Juros =  saldo devedor * taxa de juros  --%>
                        <td> <%=String.format("%,.2f", Pv - amortizacao)%> </td> <%-- saldo devedor = saldodevedor - amortizacao--%>
                       </tr>                 
                   <% Pv = Pv - amortizacao ; }%>                 
              </table>              
            <%}%> 
          <%@include file="WEB-INF/jspf/rodape.jspf" %>  
       </div>
       
    </body>
</html>
