
function irAves(){
    formulario = document.getElementById('ir-Ave');
    formulario.action = "Servidor2";
    formulario.method = "post";
    formulario.submit();
    return false; 
};


function salir(){
    formulario = document.getElementById('salir');
    formulario.action = "Servidor2";
    formulario.method = "post";
    formulario.submit();
    return false; 
};