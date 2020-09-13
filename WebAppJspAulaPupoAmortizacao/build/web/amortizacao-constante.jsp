<%-- 
    Document   : amortizacao-constante
    Created on : 9 de set de 2020, 09:09:25
    Author     : Dario
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
       <Div id="central">
        <h1>Amortização Constante</h1>
        
        <form name="formAmortizConst" action="" method="post">
            <label>Valor do Financiamento(R$):</label>
            <input type="text" name="valor" placeholder="Digite o valor aqui" size="12" maxlength="12" required>
            <label>Qant. de Parcelas:</label>
            <input type="number" name="mesesAmortConst" placeholder="2-36" min="2" max="36" placeholder="2-36" size="2" maxlength="2" required>
            <label>Taxa(%):</label>
            <input type="text" name="TaxAmortConst" id="inputidtaxConst" size="2" maxlength="2" placeholder="0,1-20" required>
            <input type="submit" name="enviar" value ="enviar">
        </form>
       </div>  
    </body>
</html>
