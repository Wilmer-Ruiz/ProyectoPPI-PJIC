
package modelodeclases;


public class Entradas {
    private String nombre;
    
    private String usuario;
    
    private String fecha;
    
    private String tipo;
    
    private String Sesion;
    
    
    
    //Constructor actua también como SET
    public Entradas(String nombre, String usuario, String fecha, String tipo) {
        this.nombre = nombre;
        this.usuario = usuario;
        this.fecha = fecha;
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getFecha() {
        return fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public String getSesion() {
        return Sesion;
    }

    public void setSesion(String Sesion) {
        this.Sesion = Sesion;
    }
    
    

}
