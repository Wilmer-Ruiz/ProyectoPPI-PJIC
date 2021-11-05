

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

        <div class="container"> 
            <form id="formulario" >
                <input type="hidden" name="pagina" />
                <div class="header">      
                    <h3>Registro </h3>
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
                    
                    <input type="button" name="cancelar" value="Cancelar" onclick="validar('cancelar')" />
                    <input type="button" name="enviar" value="Ingresar" onclick="validar('enviar')" />
                    

                    <span id="validar" class="errores">text</span>
            </form>
             </div>
    </div>
        <% 
            //Verificar el validado de CrearCuenta
            String respuesta = (String) request.getAttribute("validado");
            
            if(respuesta != null){
        
        %>
        <script>
            validarCuenta('<%=respuesta%>');
        </script>
        
        <% 
            }
        %>
    </body>
</html>
