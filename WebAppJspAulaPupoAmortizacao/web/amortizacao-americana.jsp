<%-- 
    Document   : amortizacao-americana
    Created on : 9 de set de 2020, 09:09:51
    Author     : Vinï¿½cius Marinho
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    double valor;
    int parcelas;
    int taxa;
    try {
       valor = Float.parseFloat(request.getParameter("valor"));
       parcelas = Integer.parseInt(request.getParameter("mesesAmortAmerica"));
       taxa = Integer.parseInt(request.getParameter("TaxAmortAmerica"));
    } catch(Exception e) {
        valor = 0;
        parcelas = 0;
        taxa = 0;
    }

    double juros = valor * taxa / 100;
%>
<%@include file="WEB-INF/jspf/header.jspf" %>

  <body>
    
    <div id="central">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
    <h1 class="my-5">Amortização Americana</h1>

    <form name="formAmortizAmerica" action="" method="post">
      <label>Valor do Financiamento(R$):</label>
      <input
        type="text"
        name="valor"
        
        size="12"
        maxlength="12"
        required
        pattern="[0-9]+$"
      />
      <label>Qant. de Parcelas:</label>
      <input
        type="number"
        name="mesesAmortAmerica"
        placeholder="2-36"
        min="2"
        max="36"
        placeholder="2-36"
        size="2"
        maxlength="2"
        required
      />
      <label>Taxa(%):</label>
      <input
        type="text"
        name="TaxAmortAmerica"
        id="inputidtaxAmerica"
        size="2"
        maxlength="2"
        placeholder="0,1-20"
        required
        pattern="[0-9]+$"
      />
      <input type="submit" name="enviar" class="btn btn-dark" value="enviar" />
    </form>
    <br/>
    <%if(request.getParameter("valor") != null) {%>
    
        <h4> Para um financiamento de R$  <%= String.format("%,.2f", valor) %> parcelados em <%= parcelas %> vezes com taxa de <%= taxa %> % ao mï¿½s </h4>
        <hr/>
        <br/>
        <div class="container">

          <div class="row">
            <table border="1">
              <thead>
                <tr>
                  <th>Perï¿½odo</th>
                  <th>Saldo Devedor</th>
                  <th>Amortizaï¿½ï¿½o</th>
                  <th>Juros</th>
                  <th>PMT</th>
                </tr>
              </thead>
              <tbody class="text-center">
                    <tr>
                        <td>0</td>
                        <td>R$ <%= String.format("%,.2f", valor) %></td>
                        <td>-</td>
                        <td><%= taxa%>%</td>
                        <td>-</td>
                     </tr>
                    <% for(int i = 1; i < parcelas; i++) { %>
                        <tr>
                            <td><%=i%></td>
                            <td>R$ <%= String.format("%,.2f", valor) %></td>
                            <td>-</td>
                            <td>R$ <%= String.format("%,.2f", juros) %></td>
                            <td>R$ <%= String.format("%,.2f", juros) %></td>
                        </tr>
                    <% } %>

                    <tr>
                        <td><%=parcelas%></td>
                        <td>R$ <%= String.format("%,.2f", valor) %></td>
                        <td>R$ <%= String.format("%,.2f", valor) %></td>
                        <td>R$ <%= String.format("%,.2f", juros) %></td>
                        <td>R$ <%= String.format("%,.2f", (valor+juros)) %></td>
                     </tr>
              </tbody>
            </table>
          </div>
        </div>
        </div>
    <% } %>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
  </body>
</html>
