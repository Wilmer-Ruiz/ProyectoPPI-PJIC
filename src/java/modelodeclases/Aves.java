
package modelodeclases;


public class Aves {
    
    
   private int idAve;
   private String nombreAve;
    private String habitat;
    private String fotoAve;
    
    public Aves(){}

    public Aves(int idAve, String nombreAve, String habitat, String fotoAve) {
        this.idAve = idAve;
        this.nombreAve = nombreAve;
        this.habitat = habitat;
        this.fotoAve = fotoAve;
    }

    public int getIdAve() {
        return idAve;
    }

    public String getNombreAve() {
        return nombreAve;
    }

    public String getHabitat() {
        return habitat;
    }

    public String getFotoAve() {
        return fotoAve;
    }
    
    
}
