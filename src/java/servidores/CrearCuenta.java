package servidores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CrearCuenta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pagina = request.getParameter("pagina");

        if (pagina.equals("index-crear-cuenta")) {

            RequestDispatcher despachador = request.getRequestDispatcher("jsp/crearcuenta.jsp");
            despachador.forward(request, response);

        } else if (pagina.equals("cancelar")) {
            
            RequestDispatcher despachador = request.getRequestDispatcher("index.jsp");
            despachador.forward(request, response);
            
        } else if(pagina.equals("crearcuenta")){
            
            String nombre = request.getParameter("nombre");
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            
            int countUser = 0;
            int countPass = 0;
            
            Connection conexion = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                
                conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");
                
                String consulta_sql="select count(*) as usuarios from ecopark.usuario where usuario = ?";
                
                PreparedStatement sentencia = conexion.prepareStatement(consulta_sql);
                
                sentencia.setString(1, usuario);
                
                ResultSet resultado = sentencia.executeQuery();
                
                resultado.next();
                
                countUser = resultado.getInt("usuarios");
                
                String consulta_sql2="select count(*) as pass from ecopark.usuario where contraseña = ?";
                
                sentencia = conexion.prepareStatement(consulta_sql2);
                
                sentencia.setString(1, password);
                
                resultado = sentencia.executeQuery();
                
                resultado.next();
                
                countPass = resultado.getInt("pass");
                
                if(countUser > 0){
                    request.setAttribute("validado", "usuarioexiste");
                } else if(countPass > 0){
                    request.setAttribute("validado", "passexiste");
                } else if(countUser == 0 && countPass == 0){
                    
                    
                    String consulta_sql3 =
                     "insert into ecopark.usuario (nombre, usuario, contraseña) values(?, ?, ?)";
                    
                    sentencia = conexion.prepareStatement(consulta_sql3);
                    
                    sentencia.setString(1, nombre);
                    sentencia.setString(2, usuario);
                    sentencia.setString(3, password);
                    
                    sentencia.executeUpdate();
                    
                    request.setAttribute("validado", "cuentaexitosa");
                    
                }
                
            } catch (SQLException ex){
                    System.out.println(ex.getMessage());
            } catch (ClassNotFoundException ex){
                System.out.println(ex.getMessage());
            }
            
            RequestDispatcher despachador = request.getRequestDispatcher("jsp/crearcuenta.jsp");
            despachador.forward(request, response);
            
        }
        
    }

}
