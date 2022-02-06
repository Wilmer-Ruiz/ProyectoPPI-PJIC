/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelodeclases.Ecoparque;
import modelodeclases.ListaLigada;
import modelodeclases.ListaLigadaSimple;

/**
 *
 * @author Usuario
 */
public class Servidor2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("pagina");

        if (pagina.equals("pagina2")) {
            HttpSession sesion = request.getSession(false);
            sesion.removeAttribute("nombre");
            sesion.removeAttribute("user");
            sesion.invalidate();

            response.sendRedirect("index.jsp");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pagina = request.getParameter("pagina");
         int idEcoparque;
            String nombreEco, ubicacionEco, infoEco, rutaEco, imgEco;
            ListaLigada lista = new ListaLigada();
            
            int idAve;
            String nombreAve, habitat, fotoAve;
            ListaLigadaSimple lista1 = new ListaLigadaSimple();
        if (pagina.equals("home")) {
            
            Connection conexion = null;

            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                    
                    Statement sentencia_sql = conexion.createStatement();
                    
                    ResultSet ecoparque = sentencia_sql.executeQuery("select * from ecopark.ave");
                    
                    //Recorrer los clientes que se obtuvieron de la base de datos.
                    while(ecoparque.next()){
                    idAve = ecoparque.getInt("idAve");
                    nombreAve = ecoparque.getString("nombreAve");
                    habitat = ecoparque.getString("habitat");
                    fotoAve = ecoparque.getString("fotoAve");
                    
                    lista1.insertarPrincipioNodo2(idAve, nombreAve, habitat, fotoAve);
                    
                    
                    }
                    //cerramos la conexión
                    conexion.close();
                    
                    
                    
                } catch (SQLException ex) {
                    System.out.println(ex.getStackTrace());
                }
            } catch (ClassNotFoundException ex) {
                System.out.println(ex.getStackTrace());
            }
            
            // Esta es la respuesta que viene del filtro2
            String paramRespuesta = request.getParameter("res");

            //Abrimos la sesion del usuario
            HttpSession sesion = request.getSession(false);
            //Le pasamos la respuesta a la sesion
            sesion.setAttribute("respuesta", paramRespuesta);
            request.setAttribute("ecoparque", lista1);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/pagina1.jsp");
            despachador.forward(request, response);

        } else if (pagina.equals("usuario-con-permiso")) {

            Connection conexion = null;

            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                    
                    Statement sentencia_sql = conexion.createStatement();
                    
                    ResultSet ecoparque = sentencia_sql.executeQuery("select * from ecopark.ecoparque");
                    
                    //Recorrer los clientes que se obtuvieron de la base de datos.
                    while(ecoparque.next()){
                    idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                    
                    
                    }
                    //cerramos la conexión
                    conexion.close();
                    
                    
                    
                } catch (SQLException ex) {
                    System.out.println(ex.getStackTrace());
                }
            } catch (ClassNotFoundException ex) {
                System.out.println(ex.getStackTrace());
            }
            request.setAttribute("ecoparque", lista);
            HttpSession sesion = request.getSession(false);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/pagina2.jsp");
            despachador.forward(request, response);

        } else if (pagina.equals("home-salir")) {
            HttpSession sesion = request.getSession(false);
            sesion.removeAttribute("nombre");
            sesion.removeAttribute("user");
            sesion.invalidate();

            response.sendRedirect("index.jsp");
        } else if("insertar".equals(pagina)){
        
            nombreEco = request.getParameter("nombre");
            ubicacionEco = request.getParameter("ubicacion");
            infoEco = request.getParameter("informacion");
            rutaEco = request.getParameter("ruta");
            imgEco = request.getParameter("img");
        
            Connection conexion = null;
            
            
            
            PrintWriter out = response.getWriter();
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                
                String consulta_sql
                        = "insert into ecopark.ecoparque(nombreEco, ubicacionEco, infoEco, rutaEco, imgEco) VALUES (?, ?, ?, ?, ?)";
                
                PreparedStatement sentencia = conexion.prepareStatement(consulta_sql);
                
                sentencia.setString(1, nombreEco);
                sentencia.setString(2, ubicacionEco);
                sentencia.setString(3, infoEco);
                sentencia.setString(4, rutaEco);
                sentencia.setString(5, imgEco);
                
                sentencia.executeUpdate();
                
                ResultSet ecoparque = sentencia.executeQuery("select * from ecopark.ecoparque");
                
                // Recorrer los clientes que se obtuvieron de la base de datos.
                
                while (ecoparque.next()) {
                idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                }
                
                conexion.close();
                
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Servidor2.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Servidor2.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            request.setAttribute("ecoparque", lista);
            HttpSession sesion = request.getSession(false);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/pagina2.jsp");
            despachador.forward(request, response);
            
        } else if (pagina.equals("eliminar")){
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            Connection conexion = null;
            
            PrintWriter out = response.getWriter();
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                
                String consulta_sql
                        = "delete from ecopark.ecoparque where idEcoparque = ?";
                
                PreparedStatement sentencia = conexion.prepareStatement(consulta_sql);
                
                sentencia.setInt(1, id);
                
                sentencia.executeUpdate();
                
                ResultSet ecoparque = sentencia.executeQuery("select * from ecopark.ecoparque");
                
                while (ecoparque.next()) {
                idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                }
                //confirma todo lo que se hizo, que si elimino el cliente!
                conexion.commit();
                
                conexion.close();
                
            } catch (ClassNotFoundException ex){
                out.println(ex.getException());
                out.println(ex.getMessage());
            } catch (SQLException ex) {
                out.println(ex.getCause());
                out.println(ex.getMessage());
            }
            request.setAttribute("ecoparque", lista);
            HttpSession sesion = request.getSession(false);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/pagina2.jsp");
            despachador.forward(request, response);
            
        } else if (pagina.equals("editar")) {
            
            PrintWriter out = response.getWriter();
        
            int id = Integer.parseInt(request.getParameter("id"));
            
            nombreEco = request.getParameter("nombreedit");
            ubicacionEco = request.getParameter("ubicacionedit");
            infoEco = request.getParameter("informacionedit");
            rutaEco = request.getParameter("rutaedit");
            imgEco = request.getParameter("imgedit");
            
            Connection conexion = null;
            
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                
                String consulta_sql
                        = "update ecopark.ecoparque set nombreEco = ?, "
                        + "ubicacionEco = ?, "
                        + "infoEco = ?, "
                        + "rutaEco = ?, "
                        + "imgEco = ?, "
                        + "where idEcoparque = ?";
                
                PreparedStatement sentencia = conexion.prepareStatement(consulta_sql);
                
                sentencia.setString(1, nombreEco);
                sentencia.setString(2, ubicacionEco);
                sentencia.setString(3, infoEco);
                sentencia.setString(4, rutaEco);
                sentencia.setString(5, imgEco);
                sentencia.setInt(6, id);
                
                sentencia.executeUpdate();
                
                ResultSet ecoparque = sentencia.executeQuery("select * from ecopark.ecoparque");
                
                while (ecoparque.next()) {
                idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                }
                
                conexion.commit();
                
                conexion.close();
                
            }catch (ClassNotFoundException ex){
                out.println(ex.getException());
                out.println(ex.getMessage());
            } catch (SQLException ex) {
                out.println(ex.getCause());
                out.println(ex.getMessage());
            }
            
            request.setAttribute("ecoparque", lista);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/pagina2.jsp");
            despachador.forward(request, response);
            
        } else if(pagina.equals("newhome-home")){
            
            
            
            Connection conexion = null;

            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                    
                    Statement sentencia_sql = conexion.createStatement();
                    
                    ResultSet ecoparque = sentencia_sql.executeQuery("select * from ecopark.ecoparque");
                    
                    //Recorrer los clientes que se obtuvieron de la base de datos.
                    while(ecoparque.next()){
                    idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                    
                    
                    }
                    //cerramos la conexión
                    conexion.close();
                    
                    
                    
                } catch (SQLException ex) {
                    System.out.println(ex.getStackTrace());
                }
            } catch (ClassNotFoundException ex) {
                System.out.println(ex.getStackTrace());
            }
            request.setAttribute("ecoparque", lista);
            HttpSession sesion = request.getSession(false);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/Home.jsp");
            despachador.forward(request, response);
        
        } else if(pagina.equals("ecoparks-home")){
            
            Connection conexion = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                    
                    Statement sentencia_sql = conexion.createStatement();
                    
                    ResultSet ecoparque = sentencia_sql.executeQuery("select * from ecopark.ecoparque");
                    
                    //Recorrer los clientes que se obtuvieron de la base de datos.
                    while(ecoparque.next()){
                    idEcoparque = ecoparque.getInt("idEcoparque");
                    nombreEco = ecoparque.getString("nombreEco");
                    ubicacionEco = ecoparque.getString("ubicacionEco");
                    infoEco = ecoparque.getString("infoEco");
                    rutaEco = ecoparque.getString("rutaEco");
                    imgEco = ecoparque.getString("imgEco");
                    
                    lista.insertarPrincipioNodo(idEcoparque, nombreEco, ubicacionEco, infoEco, rutaEco, imgEco);
                    
                    
                    }
                    //cerramos la conexión
                    conexion.close();
                    
                    
                    
                } catch (SQLException ex) {
                    System.out.println(ex.getStackTrace());
                }
            } catch (ClassNotFoundException ex) {
                System.out.println(ex.getStackTrace());
            }
            request.setAttribute("ecoparque", lista);
            HttpSession sesion = request.getSession(false);
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/ecoparks.jsp");
            despachador.forward(request, response);
        }
                

    }

}
