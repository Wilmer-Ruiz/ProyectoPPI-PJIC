<%-- 
    Document   : newHome
    Created on : 8/09/2021, 11:04:23 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/newHome.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <div class="title">
            <h1>ECOPARK PALMAS</h1>

        </div>
        

        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="img/ecoparque.jpg" class="d-block w-100" alt="..." width="620px" height="420px">
                            </div>
                            <div class="carousel-item">
                                <img src="img/ecoparque2.jpg" class="d-block w-100" alt="..." width="620px" height="420px">
                            </div>
                            <div class="carousel-item">
                                <img src="img/ecoparque3.jpg" class="d-block w-100" alt="..." width="620px" height="420px">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 style="text-align: center">¡Sobre Ecopark Palmas!</h1>
                </div>
            </div>
        </div>

        <div class="container">
            <p>Ecopark Palmas es una página web la cual se enfoca en mostrar los Ecoparques y Aves de la región de Antioquía,
            está página tiene todo lo que un aventurero como tú necesita para salir de su zona de confort y explorar la inmensa cantidad
            de ecoparques con los que cuenta nuestra región.</p>
            <p>Te preguntaras ¿por qué nuestro nombre?</p>
            <p>Este peculiar nombre se debe a una telenovela del año 1990 producida por RCN Televisión, de su epoca
            una de las novelas más destacadas la cual lleva por nombre La casa de las dos Palmas, grabada en un prueblo de Antioquía
            llamado Balandú, el cual cuenta con unas zonas verdes, bosques supremamente hermosos, entonces un lugar como Balandú, representa
            demasiadas partes de Antioquía que cuentan con zonas iguales y en su efecto con Ecoparques.</p>
            
            <h3 style="text-align: center">Da Click y conoce nuestro Ecoparques y Aves</h3>
            
            <form method="post" action="Servidor2" style="text-align: center">
            <input type="submit"  name="enviar" value="Mira nuestros Ecoparques y Aves!!"/>
            <input type="hidden" name="pagina" value="newhome-home"/>
        </form>
        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

    </body>
</html>
