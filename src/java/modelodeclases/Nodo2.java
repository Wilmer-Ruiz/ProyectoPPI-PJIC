/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelodeclases;

/**
 *
 * @author Usuario
 */
public class Nodo2 {
    
    public Nodo2(Aves dato) {
        this.dato = dato;
    }
   
    public Nodo2 siguiente = null;
    
    public Nodo2(){}
    
    public Aves dato;
}
