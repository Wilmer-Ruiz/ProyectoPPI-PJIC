/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelodeclases;


public class ListaLigadaSimple {
    Nodo2 apuntador = null;
    Nodo2 cabeza = null;
    public int size = 0;

    public void insertarPrincipioNodo2(int idAve, String nombreAve, String habitat,
            String fotoAve) {
        Nodo2 newNodo = new Nodo2(new Aves(idAve, nombreAve, habitat,
                fotoAve));
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
                System.out.println(apuntador.dato.getNombreAve());
                apuntador = apuntador.siguiente;
        }
        }
        System.out.println(apuntador.dato.getNombreAve());
    }

    public Aves getAves(int index) {
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
