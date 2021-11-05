/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelodeclases;
import modelodeclases.Ecoparque;


/**
 *
 * @author Usuario
 */
public class Nodo {

    public Nodo(Ecoparque dato) {
        this.dato = dato;
    }
   
    public Nodo siguiente = null;
    
    public Nodo(){}
    
    public Ecoparque dato;
    
    
    
}