
package modelodeclases;

import java.util.ArrayList;
/**
 * Clase para utilizar un array que nos ayudará
 * con las entradas para controlar las sesiones.
 * @author Wilmer
 */

public class Ayudas {
    //Static para poderlo usar fasilmente en otras partes
    private static ArrayList entradas = new ArrayList<Entradas>();
    
    //contar posiciones y entradas que hayan.
    //-1 porque el conteo no ha iniciado, ni entrado nada
    public static int conteo = -1;
    
    public static void ingresarEntrada(Entradas e){
        entradas.add(e);   
        conteo++;
    }
    
    //metodo para retornar todo el vector
    public static ArrayList<Entradas> getEntradas(){
        return entradas;
    }
}
