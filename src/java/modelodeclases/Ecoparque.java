package modelodeclases;
/**
 * Clase en la cual se ingresa toda la información sobre el ecoparque.
 * @author Usuario
 */
public class Ecoparque {
  //Se declaran las variables 
    private int idEcoparque;
    private String nombreEco;
    private String ubicacionEco;
    private String infoEco;
    private String rutaEco;
    private String imgEco;
    //Constructor para ecoparque 
    public Ecoparque() {
    }
    /**
     * @param idEcoparque Recibe como parametro idEcoparque
     * @param nombreEco Recibe como parametro nombreEco
     * @param ubicacionEco Recibe como parametro ubicacionEco
     * @param infoEco Recibe como parametro infoEco
     * @param rutaEco Recibe como parametro rutaEco
     * @param imgEco
     */
    public Ecoparque(int idEcoparque, String nombreEco, String ubicacionEco, String infoEco, String rutaEco, String imgEco) {
        this.idEcoparque = idEcoparque;
        this.nombreEco = nombreEco;
        this.ubicacionEco = ubicacionEco;
        this.infoEco = infoEco;
        this.rutaEco = rutaEco;
        this.imgEco = imgEco;
    }
    
    /**
     * 
     * @return el id del ecoparque
     */
    public int getIdEcoparque() {
        return idEcoparque;
    }
    /**
     * @return  el nombre del ecoparque
     */
    public String getNombreEco() {
        return nombreEco;
    }
    /**
     * @return la ubicación del ecoparque
     */
    public String getUbicacionEco() {
        return ubicacionEco;
    }
    /**
     * @return la información del ecoparque
     */
    public String getInfoEco() {
        return infoEco;
    }
    /**
     * 
     * @return las rutas del ecoparque
     */
    public String getRutaEco() {
        return rutaEco;
    }

    public String getImgEco() {
        return imgEco;
    }

    

    

}
