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
        <link rel="stylesheet" type="text/css" href="css/fontello.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        
      <header>
        <nav>
            <form method="post" action="Servidor2" style="text-align: center">
            <input type="submit"  name="enviar" value="Ecoparques"/>
            <input type="hidden" name="pagina" value="newhome-home"/>
            <input type="submit" name="enviar" value="Aves" />
        </nav>
        <section class="textos-header">
            <h1>La mejor web de ecoparques Antioqueños</h1>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                    style="stroke: none; fill: #fff;"></path>
            </svg></div>
    </header>
        
        
    <!---  <div class="title">
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

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
    </body>
</html>
