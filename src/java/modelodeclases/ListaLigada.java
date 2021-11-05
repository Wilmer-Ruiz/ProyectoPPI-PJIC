/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelodeclases;

import modelodeclases.Nodo;
import modelodeclases.Ecoparque;

/**
 *
 * @author Usuario
 */
public class ListaLigada {

    Nodo apuntador = null;
    Nodo cabeza = null;
    public int size = 0;

    public void insertarPrincipioNodo(int idEcoparque, String nombreEco,
            String ubicacionEco, String infoEco, String rutaEco, String imgEco) {
        Nodo newNodo = new Nodo(new Ecoparque(idEcoparque, nombreEco, ubicacionEco,
                infoEco, rutaEco, imgEco));
        if (cabeza == null) {
            cabeza = newNodo;
        } else {
            newNodo.siguiente = cabeza;
            cabeza = newNodo;
        }
        size++;
    }
    
    
    
//    public int tamano(){
//       
//        return size;
//    }
    
    public void mostrar(){
        
        if (cabeza == null) {
            System.out.println("No hay nodos");
        } else {
            apuntador = cabeza;
            while (apuntador.siguiente != null){
                System.out.println(apuntador.dato.getNombreEco());
                apuntador = apuntador.siguiente;
        }
        }
        System.out.println(apuntador.dato.getNombreEco());
    }

    public Ecoparque getEcoparque(int index) {
        apuntador = null;
        if (cabeza != null) {
            int contador = 0;
            apuntador = cabeza;
            while (contador < index && apuntador.siguiente != null) {
                apuntador = apuntador.siguiente;
                contador++;
            }
        } else {
            System.out.println("La lista esta vacía");
        }
        return apuntador.dato;
    }

}
