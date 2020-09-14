<%-- 
    Document   : amortizacao-americana
    Created on : 9 de set de 2020, 09:09:51
    Author     : Vinícius Marinho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    double valor;
    int parcelas;
    int taxa;
    try {
       valor = Integer.parseInt(request.getParameter("valor"));
       parcelas = Integer.parseInt(request.getParameter("mesesAmortAmerica"));
       taxa = Integer.parseInt(request.getParameter("TaxAmortAmerica"));
    } catch(Exception e) {
        valor = 0;
        parcelas = 0;
        taxa = 0;
    }

    double juros = valor * taxa / 100;
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <title>Aula Pupo - Amortização Americana</title>
    <link rel ="Stylesheet" type="text/css" href="Css_Amortizacao.css">
  </head>
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
     <h3> Para um financiamento de R$  <%= String.format("%,.2f", valor) %> parcelados em <%= parcelas %> vezes com taxa de <%= taxa %> % ao mês </h3>
    <hr/>
    <br/>
    <div class="container">
        
      <div class="row">
        <table class="col-6 table table-bordered mt-5">
          <thead>
            <tr>
              <th>Período</th>
              <th>Saldo Devedor</th>
              <th>Amortização</th>
              <th>Juros</th>
              <th>PMT</th>
            </tr>
          </thead>
          <tbody class="text-center">
            
             <%if(request.getParameter("valor") != null) {%>
                <tr>
                    <td>0</td>
                    <td><%= String.format("%,.2f", valor) %></td>
                    <td>-</td>
                    <td><%= taxa%>%</td>
                    <td>-</td>
                 </tr>
                <% for(int i = 1; i < parcelas; i++) { %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=String.format("%,.2f", valor)%></td>
                        <td>-</td>
                        <td><%= String.format("%,.2f", juros) %></td>
                        <td><%= String.format("%,.2f", juros) %></td>
                    </tr>
                <% } %>
                
                <tr>
                    <td><%=parcelas%></td>
                    <td><%= "0,00" %></td>                        <%-- <td><%= valor %></td>  --%>
                    <td><%= String.format("%,.2f", valor) %></td>
                    <td><%= String.format("%,.2f", juros) %></td>
                    <td><%= String.format("%,.2f", (valor+juros)) %></td>
                 </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
     <%@include file="WEB-INF/jspf/rodape.jspf" %>     
    </div>
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
    
  </body>
</html>
