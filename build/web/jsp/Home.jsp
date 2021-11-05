<%-- 
    Document   : Home
    Created on : 16/08/2021, 04:30:22 PM
    Author     : Usuario
--%>
<%@page import="javafx.scene.input.KeyCode"%>
<%@page import="modelodeclases.ListaLigada"%>
<%@page import="modelodeclases.Entradas"%>
<%@page import="modelodeclases.Ayudas"%>
<%@page import="modelodeclases.Ecoparque" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/card.css" />
        <script type="text/javascript" src="js/js5.js"></script> 

    </head>
    <body>
        <%

            

            //Se crean las variables recibiendo la sesión de Login
            String nombre = (String) session.getAttribute("nombre");
            String username = (String) session.getAttribute("user");

            //Validación
            if (nombre == null && username == null) {
                //Que se vaya a index, si el usuario no es correcto
                response.sendRedirect("index.jsp");
            } else {
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Ecoparques</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">                     
                        <li class="nav-item">
                            <form class="nav-link active" id="ir-Ave"onclick="irAves()">
                                <span> Aves </span>
                                <input type="hidden" name="pagina" value="home"/>
                            </form>
                        </li>
                        <li class="nav-item" >
                            <form class="nav-link active" id="salir"onclick="salir()">
                                <span> Salir </span>
                                <input type="hidden" name="pagina" value="home-salir"/>
                            </form>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </div>
        </nav>

        <span>
            Nombre: <%=nombre%> 
            User: <%=username%>
        </span>
        <%
            }
        %>

        <%
            ListaLigada lista = (ListaLigada) request.getAttribute("ecoparque");

            if (lista != null) {
                for (int i = 0; i < lista.size; i++) {


        %> 

        <section class="contenedor">

            <div class="card m-2 "<%= lista.getEcoparque(i).getIdEcoparque()%> >
                <img class="card-img-top"
                     src = " <%= lista.getEcoparque(i).getImgEco()%> "
                     alt="...">
                <div class="card-body">
                    <h5 class="filas"><%= lista.getEcoparque(i).getNombreEco()%></h5>
                    <p class="card-text"><%= lista.getEcoparque(i).getInfoEco()%></p>
                    <p class="card-text"><%= lista.getEcoparque(i).getUbicacionEco()%></p>
                    <a href="#" class="btn btn-primary">Ver más</a>
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








        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
