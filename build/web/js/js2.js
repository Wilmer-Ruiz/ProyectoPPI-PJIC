
function validarPermiso(respuesta, usuario){
    
    var ventana = document.getElementById("ventana-emergente");
    var btn = document.getElementById("btn-aceptar");
    var texto = document.getElementById("mensaje");
    
    ventana.style.display = 'block';
    
    if (respuesta === "true"){
        
        texto.innerHTML = usuario+".\n Tienes permisos para ver <br> los ingresos a esta página.";
        
        btn.onclick = function (){
            llamarServlet("usuario-con-permiso");
            ventana.style.display = "none";
        };
    }else {
        texto.innerHTML = usuario+".\n No tienes permisos para ver <br> los ingresos a esta página.";
        btn.onclick = function() {
            ventana.style.display = "none";           
        };
        
    }
    return false;
    
}

function llamarServlet(idFormulario) {
    
    formulario = document.getElementById(idFormulario);
    formulario.action = "Servidor2";
    formulario.method = "post";
    formulario.submit();   
}

