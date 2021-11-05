

<%@page import="javafx.scene.input.KeyCode"%>
<%@page import="modelodeclases.ListaLigada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelodeclases.Entradas"%>
<%@page import="modelodeclases.Ayudas"%>
<%@page import="modelodeclases.Ecoparque" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecoparques</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/pagina2.css" />
        <script type="text/javascript" src="js/js4.js"></script>
        <link rel="stylesheet" type="text/css" href="css/filas.css" />


    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <h1>Entradas recientes al Sistema</h1>

        <span class="entradas">Tipo</span>
        <span class="entradas">Nombre</span>
        <span class="entradas">Usuario</span>
        <span class="entradas">Fecha Ingreso</span>
        <span class="entradas">Sesión</span><br/>

        <% ArrayList<Entradas> entradas = (ArrayList<Entradas>) Ayudas.getEntradas();
            if (!entradas.isEmpty()) {
                for (Entradas e : entradas) {
        %>
        <span class="entradas"><%=e.getTipo()%></span>
        <span class="entradas"><%=e.getNombre()%></span>
        <span class="entradas"><%=e.getUsuario()%></span>
        <span class="entradas"><%=e.getFecha()%></span>
        <span class="entradas"><%=e.getSesion()%></span><br/>

        <%
                }
            }
        %>

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
        <span style="float: right;">
            Nombre: <%=nombre%> <br/>
            User: <%=username%>
        </span>
        <%
            }
        %>

        <<h1>Listado de Ecoparques</h1>

        <!-- Imagen tipo botón para devolverse a la página home -->
        <div class="iconos" onclick="llamarServlet('llamarServlet')">
            <img id="home" src="img/home.png">
            <form id="llamarServlet" method="post" action="Ecoparques">
                <input type="hidden" name="pagina" value="ecoparque-home"/>
            </form>
        </div>

        <!-- Cabecera de la tabla de Ecoparques -->
        <span class="cabecera">ID</span>
        <span class="cabecera">Nombre Ecoparque</span>
        <span class="cabecera">Ubicación</span>
        <span class="cabecera">Información</span>
        <span class="cabecera">Rutas</span>
        <span class="cabecera">Imagenes</span><br/>
        <!-- Código Java que recibe a los clientes que vienen del Servlet Ecoparques -->
        <%
            //variable para ir cambiando el color de cada fila
            int controlador_color = 0;
            String color1 = "#CAE1FF";
            String color2 = "#BCD2EE";

            String color_activo = color1;

            ListaLigada lista = (ListaLigada) request.getAttribute("ecoparque");

            if (lista != null) {
                for (int i = 0; i < lista.size; i++) {

                    color_activo = (color_activo == color1) ? color2 : color1;


        %>
        <span class="iconos"></span>
        <span style="background-color:<%=color_activo%>" class="filas"><%="Id: " + lista.getEcoparque(i).getIdEcoparque()%></span> 
        <span style="background-color:<%=color_activo%>" class="filas"><%= lista.getEcoparque(i).getNombreEco()%></span>
        <span style="background-color:<%=color_activo%>" class="filas"><%= lista.getEcoparque(i).getUbicacionEco()%></span>
        <span style="background-color:<%=color_activo%>" class="filas"><%= lista.getEcoparque(i).getInfoEco()%></span>
        <span style="background-color:<%=color_activo%>" class="filas"><%= lista.getEcoparque(i).getRutaEco()%></span>
        <span style="background-color:<%=color_activo%>" class="filas"><%= lista.getEcoparque(i).getImgEco()%></span>
        
        <input type="radio" name="seleccionado" 
               onclick="cargarDatos('<%=lista.getEcoparque(i).getIdEcoparque()%>',
                           '<%=lista.getEcoparque(i).getNombreEco()%>',
                           '<%=lista.getEcoparque(i).getUbicacionEco()%>',
                           '<%=lista.getEcoparque(i).getInfoEco()%>',
                           '<%=lista.getEcoparque(i).getRutaEco()%>',
                           '<%=lista.getEcoparque(i).getImgEco()%>')" />
        <br/>
        

        <%
            }
        } else {
        %>
        <p><%="Vacio"%></p>
        <%
            }
        %>
        <!-- Ventana emergente para ingresar los ecoparques -->
        <div id="ventana-emergente" class="emergente">
            <div class="contenido-emergente">
                <form id="formulario-insertar">
                    <h2 class="tituloform"> Insertar Ecoparque </h2>
                    <span id="area-mensaje"></span>

                    <span class="texto-entrada">Nombre:</span>
                    <input type="text" name="nombre" class="entradas" />

                    <span class="texto-entrada">Ubicación:</span>
                    <input type="text" name="ubicacion" class="entradas" />

                    <span class="texto-entrada">Información:</span>

                    <div class="texto-entrada">
                        <textarea class="entradas" name="informacion" id="floatingTextarea2" style="height: 100px" ></textarea>
                    </div>  
                 
                    <span class="texto-entrada">Ruta:</span>
                    <input type="text" name="ruta" class="entradas" />
                    
                    <span class="texto-entrada">Imagen:</span>
                    <input type="text" name="img" class="entradas" />

                    <input class="formulario-acciones" type="reset" value="Reiniciar" />

                    <input class="formulario-acciones" type="button"
                           value="Cancelar"
                           onclick="cancelar()" />

                    <input class="formulario-acciones" type="button"
                           value="Insertar"
                           onclick="insertar2()" />

                    <input type="hidden" name="pagina" value="insertar" />
                </form>
            </div>
        </div>
        
        <!-- Ventana emergente para editar o eliminar un ecoparque -->
        <div id="ventana-emergente-editar" class="emergente">
            <div class="contenido-emergente">
                <form id="formulario-editar">
                    <h2 style="background-color: skyblue; padding: 10px; text-align: center; ">Actualizar Ecoparque</h2>
                    
                    <span id="area-mensaje-editar"></span>
                    
                    <span class="texto-entrada">Nombre:</span>
                    <input type="text" name="nombreedit" class="entradas" />
                    
                    <span class="texto-entrada">Ubicacion:</span>
                    <input type="text" name="ubicacionedit" class="entradas" />
                    
                    <span class="texto-entrada">Información:</span>

                    <div class="texto-entrada">
                        <textarea class="entradas" name="informacionedit" id="floatingTextarea22" style="height: 100px" ></textarea>
                    </div>
                    
                    <span class="texto-entrada">Ruta:</span>
                    <input type="text" name="rutaedit" class="entradas" />
                    
                    <span class="texto-entrada">Imagen:</span>
                    <input type="text" name="imgedit" class="entradas" />
                    
                    <input class="formulario-acciones" type="button" id="cancelar" value="Cancelar" />
                    <input class="formulario-acciones" type="button" id="eliminar" value="Eliminar" />
                    <input class="formulario-acciones" type="button" id="actualizar" value="Actualizar" />
                    
                    <input type="hidden" name="pagina" />
                    <input type="hidden" name="id" />
                </form>      
            </div>
        </div>
        
        
        
        

        <!-- Formulario de la página principal -->

        <form>
            <input class="formulario-controlador" type="button" value="Insertar" onclick="insertar()" />
        </form>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>




