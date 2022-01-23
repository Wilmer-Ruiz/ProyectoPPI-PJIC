

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
        <link rel="stylesheet" type="text/css" href="css/registro.css" />
        <script type="text/javascript" src="js/js3.js"></script> 
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>

        <div class="login-box">
            <img src="img/logo-login2.jpg" class="avatar" alt="Logo regiss">
            <h1>Registro</h1>

            <form id="formulario" >
                <input type="hidden" name="pagina" />
                <label for="username">Nombre:</label>
                <input type="text" placeholder="Ingrese nombre" name="nombre"/>
                <span id="nombre" class="errores">text</span>

                <label for="username2">Usuario:</label>
                <input type="text" placeholder="Ingrese usuario" name="usuario"/>
                <span id="usuario" class="errores">text</span>

                <label for="contraseña">Contraseña:</label>
                <input type="password" placeholder="Ingrese contraseña" name="password"/>
                <span id="password" class="errores">text</span>

                <label for="contraseña2">Confirmar contraseña:</label>
                <input type="password" placeholder="Confirmar contraseña" name="confirmarpassword"/>
                <span id="confirmarpassword" class="errores">text</span>

                <input type="button" name="cancelar" value="Cancelar" onclick="validar('cancelar')" />
                <input type="button" name="enviar" value="Ingresar" onclick="validar('enviar')" />


                <span id="validar" class="errores">text</span>
            </form>

        </div>

        
        <%
            //Verificar el validado de CrearCuenta
            String respuesta = (String) request.getAttribute("validado");

            if (respuesta != null) {

        %>
        <script>
            validarCuenta('<%=respuesta%>');
        </script>

        <%
            }
        %>
    </body>
</html>
