package filtros;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 *
 * @author Usuario
 */
public class Filtro1 implements Filter {

    private FilterConfig filterConfig = null;

    private String password = null;
    private String password2 = null;
    private String user = null;
    private String user2 = null;

    public Filtro1() {
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        //Antes de que pasen al servidor
        String paramUsuario = request.getParameter("usuario");
        String paramPassword = request.getParameter("password");

        String res = validarUsuario(paramUsuario, paramPassword);

        //Hacemos un vector para pasar la res
        String valor[] = {res};

        //Creación del Objeto, dando como parametro HttpServletRequest
        //Para que request funcione.
        ParametroFiltro1 parametro = new ParametroFiltro1((HttpServletRequest) request);
        //Valor sale del vector
        parametro.setParameter("res", valor);
        Throwable problem = null;
        try {
            //Pasan al servidor
            chain.doFilter(parametro, response);
        } catch (Throwable t) {
            problem = t;
            t.printStackTrace();
        }
        // después de que pasan al servidor

        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    //Validaciones de usuario
    private String validarUsuario(String usuario, String pass) {

        String validar = "incorrecto";

        int countUser = 0;
        int countPass = 0;

        Connection conexion = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecopark", "root", "");

            String consulta_sql = "select count(*) as usuarios from ecopark.usuario where usuario = ?";

            PreparedStatement sentencia = conexion.prepareStatement(consulta_sql);

            sentencia.setString(1, usuario);

            ResultSet resultado = sentencia.executeQuery();

            resultado.next();

            countUser = resultado.getInt("usuarios");

            String consulta_sql2 = "select count(*) as pass from ecopark.usuario where contraseña = ?";

            sentencia = conexion.prepareStatement(consulta_sql2);

            sentencia.setString(1, pass);

            resultado = sentencia.executeQuery();

            resultado.next();

            countPass = resultado.getInt("pass");

            if (countUser != 1) {
                validar = "usuario-incorrecto";
            } else if (countPass != 1) {
                validar = "password-incorrecto";
            } else if (countUser == 1 && countPass == 1) {
                
                validar = "valido";

            } else if (countUser == 0 && countPass == 0) {
                
                validar = "incorrecto";

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        
        return (validar);
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (password == null) {
                password = filterConfig.getInitParameter("pass");
            }
            if (password2 == null) {
                password2 = filterConfig.getInitParameter("pass2");
            }
            if (user == null) {
                user = filterConfig.getInitParameter("user");
            }
            if (user2 == null) {
                user2 = filterConfig.getInitParameter("user2");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("Filtro1()");
        }
        StringBuffer sb = new StringBuffer("Filtro1(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

    class ParametroFiltro1 extends HttpServletRequestWrapper {

        protected Hashtable localParams = null;

        //Constructor
        public ParametroFiltro1(HttpServletRequest request) {
            super(request);
        }

        public void setParameter(String name, String[] values) {

            if (localParams == null) {
                localParams = new Hashtable();
                //Copy the parameters from the underlying request.
                Map wrappedParams = getRequest().getParameterMap();
                Set keySet = wrappedParams.keySet();
                for (Iterator it = keySet.iterator(); it.hasNext();) {
                    Object key = it.next();
                    Object value = wrappedParams.get(key);
                    localParams.put(key, value);
                }
            }
            localParams.put(name, values);
        }

        @Override
        public String getParameter(String name) {

            if (localParams == null) {
                return getRequest().getParameter(name);
            }
            Object val = localParams.get(name);
            if (val instanceof String) {
                return (String) val;
            }
            if (val instanceof String[]) {
                String[] values = (String[]) val;
                return values[0];
            }
            return (val == null ? null : val.toString());
        }
    }

}
