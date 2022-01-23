<%-- 
    Document   : pagina1
    Created on : 26/08/2021, 08:51:09 PM
    Author     : Usuario
--%>

<%@page import="modelodeclases.ListaLigadaSimple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/pagina2.css" />
        <script type="text/javascript" src="js/js2.js"></script> 
        <script type="text/javascript" src="js/js5.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/card.css" />
    </head>
    <body>
        <%

            //Se crean las variables recibiendo la sesión de Login
            String nombre = (String) session.getAttribute("nombre");
            String username = (String) session.getAttribute("user");
            String respuesta = (String) session.getAttribute("respuesta");

            //Validación
            if (nombre == null && username == null) {
                //Que se vaya a index, si el usuario no es correcto
                response.sendRedirect("index.jsp");
            } else {
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-success">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Aves</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">       
                        <!-- Botón para validar si se tiene el permiso de ir a página 2 -->
                        <input id="btn-validar"
                               type="button"
                               name="enviar"
                               value="Ver entradas" 
                               onclick="validarPermiso('<%=respuesta%>', '<%=username%>')"/>
                        <li class="nav-item" >
                            <form class="nav-link active"  id="salir"onclick="salir()">
                                <span> Salir </span>
                                <input type="hidden" name="pagina" value="home-salir"/>
                            </form>
                        </li>                       
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-dark" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>




        <span>
            Bienvenido <%=nombre%> 
            
        </span>
        <%
            }
        %>
        <!-- Ventana emergente, inicialmente es invisible 
        se activa cuando se presiona el botón para ir a la página 2-->
        <div id="ventana-emergente" class="emergente">
            <div class="contenido-emergente">
                <p id="mensaje"></p>
                <button id="btn-aceptar">Aceptar</button>
            </div>
        </div>

        <%
            ListaLigadaSimple lista1 = (ListaLigadaSimple) request.getAttribute("ecoparque");

            if (lista1 != null) {
                for (int i = 0; i < lista1.size; i++) {


        %> 

        <section class="contenedor">

            <div class="card m-2 "<%= lista1.getAves(i).getIdAve()%> >
                <img class="card-img-top"
                     src = " <%= lista1.getAves(i).getFotoAve()%> "
                     alt="...">
                <div class="card-body">
                    <h5 class="filas"><%= lista1.getAves(i).getNombreAve()%></h5>
                    <p>Su habitat:</p>
                    <p class="card-text"><%= lista1.getAves(i).getHabitat()%></p>                   
                </div>
            </div>  


            <%    }
            } else {
            %>
            <p><%="Vacio"%></p>
            <%
                }
            %>
        </section>





        <!-- Formulario para enviar al usuario que tiene permiso a la 
        página 2 de los ingresos a la página-->
        <form id="usuario-con-permiso">
            <input type="hidden" name="pagina" value="usuario-con-permiso" />
        </form>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
