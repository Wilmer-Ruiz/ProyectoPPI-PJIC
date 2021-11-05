<%-- 
    Document   : index
    Created on : 15/08/2021, 02:09:05 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/css1.css" />
        <script type="text/javascript" src="js/js1.js"></script>       



        <title>Inicio de sesión</title>

    </head>
    <body>   
            <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            %>
        <div class="container"> 
            <form id="formulario" method="post" action="Login" onsubmit="return validar()">
                <div class="header">      
                    <h3>Inicio Sesión </h3>
                </div>
                <div class="sep"></div>
                <div class="inputs">
                    <label>Nombre:</label>
                    <input type="text" name="nombre"/>
                    <span id="nombre" class="errores">text</span>

                    <label>Usuario:</label>
                    <input type="text" name="usuario"/>
                    <span id="usuario" class="errores">text</span>

                    <label>Contraseña:</label>
                    <input type="password" name="password"/>
                    <span id="password" class="errores">text</span>

                    <label>Confirmar contraseña:</label>
                    <input type="password" name="confirmarpassword"/>
                    <span id="confirmarpassword" class="errores">text</span>

                    <input type="submit" name="enviar" value="Ingresar" />
                    <input type="hidden" name="pagina" value="index" />

                    <span id="validar" class="errores">text</span>
            </form>

            
            <!-- Formulario para crear cuenta -->
            <form id="crear-cuenta" onclick="crearCuenta()">
                <span> Crear una Cuenta </span>
                <input type="hidden" name="pagina" value="index-crear-cuenta"/>
            </form>

            <% 
           
             String respuesta = (String) request.getAttribute("respuesta");
            
             if(respuesta != null){
           
           
            %>

            <script>
                //enviando variable Java a JS
                // '=' lo enviamos directamente.
               validarLogin('<%=respuesta%>');

            </script>


            <% 
                }
            %>
        </div>
    </div>
</body>
</html>
