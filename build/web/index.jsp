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
            
            <div class="login-box">
                <img class="avatar" src="img/logo-login2.jpg" alt="Logo login"/>
                <h1>Inicio de sesión</h1>
                <form id="formulario" method="post" action="Login" onsubmit="return validar()">
                    <label for="username">Nombre</label>
                    <input type="text" placeholder="Ingrese nombre" name="nombre"/>
                    <span id="nombre" class="errores">text</span>
                    
                    <label for="username2">Usuario</label>
                    <input type="text" placeholder="Ingrese usuario" name="usuario"/>
                    <span id="usuario" class="errores">text</span>
                    
                    <label for="contraseña">Contraseña</label>
                    <input type="password" placeholder="Contraseña" name="password"/>
                    <span id="password" class="errores">text</span>
                    
                    <label for="contraseña2">Confirmar contraseña</label>
                    <input type="password" placeholder="Confirmar contraseña" name="confirmarpassword"/>
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
            </div>  
            
            
    

            
            

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
     
</body>
</html>
