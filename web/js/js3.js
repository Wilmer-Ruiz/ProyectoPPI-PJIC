
//Función para validar los botones del formulario CrearCuenta
function validar(evento) {
    if (evento === 'cancelar') {
        // Para devolverse a Login
        formulario = document.getElementById('formulario');
        formulario.action = "CrearCuenta";
        formulario.method = "post";
        formulario.elements[0].value = "cancelar";
        formulario.submit();
    } else if(evento === 'enviar') {

        validarFormulario();

    }
    return false;
}

//Preguntar si un string que se ingreso en un campo 
// de texto es vacio
function esVacio(str) {
    return (!str || str.length === 0);
}

//Preguntar si en un espacio de texto se ingreso
//un espacio vacios}
function stringVacio(str) {
    return (!str || /^\s*$/.test(str));
}

//Validar el formulario

function validarFormulario() {

    var estado = true;
    var tiempo = 3000;

    //Atrapar lo que el usuario ingrese en el formulario
    var nombre = document.querySelector('[name="nombre"]').value;
    if (esVacio(nombre) || stringVacio(nombre)) {
        //activar el span, si no a ingresado nada.
        //e = elemento.
        e = document.getElementById('nombre');
        e.style.visibility = 'visible';
        e.innerHTML = "Ingrese Nombre!";
        // meter el span en el recuadro de poner nombre
        e.style.left = 500 + 'px';
        e.style.top = 150 + 'px';
        //Para que se quite el span luego de 2 segundos
        setTimeout(function () {
            e.style.visibility = 'hidden';
        }, tiempo);
        estado = false;
    }
    //Atrapar lo que el usuario ingrese en el formulario
    var usuario = document.querySelector('[name="usuario"]').value;
    if (esVacio(usuario) || stringVacio(usuario)) {
        //activar el span, si no a ingresado nada.
        e1 = document.getElementById("usuario");
        e1.style.visibility = 'visible';
        // meter el span en el recuadro de poner nombre
        e1.innerHTML = "Ingresar Usuario";
        e1.style.left = 500 + 'px';
        e1.style.top = 245 + 'px';
        //Para que se quite el span luego de 2 segundos
        setTimeout(function () {
            e1.style.visibility = 'hidden';
        }, tiempo);
        estado = false;
    }

    var password = document.querySelector('[name="password"]').value;
    if (esVacio(password) || stringVacio(password)) {
        e2 = document.getElementById("password");
        e2.style.visibility = 'visible';
        e2.innerHTML = "Ingrese Contraseña";
        e2.style.left = 500 + 'px';
        e2.style.top = 337 + 'px';

        setTimeout(function () {
            e2.style.visibility = 'hidden';
        }, tiempo);
        estado = false;
    }

    // el '!esVacio' significa si NO es vacio.
    if (!esVacio(password) && password.length < 8) {
        e3 = document.getElementById("password");
        e3.style.visibility = 'visible';
        e3.innerHTML = "Contraseña de 8 letras";
        e3.style.left = 500 + 'px';
        e3.style.top = 337 + 'px';

        setTimeout(function () {
            e3.style.visibility = 'hidden';
        }, tiempo);
        estado = false;

    }

    var confirmarpassword = document.querySelector('[name="confirmarpassword"]').value;
    if (esVacio(confirmarpassword) || stringVacio(confirmarpassword)) {
        e4 = document.getElementById("confirmarpassword");
        e4.style.visibility = 'visible';
        e4.innerHTML = "Confirmar Contraseña";
        e4.style.left = 500 + 'px';
        e4.style.top = 430 + 'px';

        setTimeout(function () {
            e4.style.visibility = 'hidden';
        }, tiempo);
        estado = false;

    }
    //Comparar que contraseña y confirmar contraseña no sean distintas.
    if (password !== confirmarpassword) {
        e5 = document.getElementById("validar");
        e5.style.visibility = 'visible';
        e5.innerHTML = "Contraseñas No Coindice";
        e5.style.left = 210 + 'px';
        e5.style.top = 150 + 'px';

        setTimeout(function () {
            e5.style.visibility = 'hidden';
        }, tiempo);
        estado = false;
    }

    if ((esVacio(nombre) || stringVacio(nombre)) &&
            (esVacio(usuario) || stringVacio(usuario)) &&
            (esVacio(password) || stringVacio(password)) &&
            (esVacio(confirmarpassword) || stringVacio(confirmarpassword))
            ) {
        e6 = document.getElementById("validar");
        e6.style.visibility = 'visible';
        e6.style.heigth = 80 + 'px';
        e6.style.width = 200 + 'px';
        e6.innerHTML = "Debes ingresar<br/>todos los campos!";
        e6.style.left = 210 + 'px';

        setTimeout(function () {
            e6.style.visibility = 'hidden';
        }, tiempo);
        estado = false;
    }
    if(estado){
        
        formulario = document.getElementById('formulario');
        formulario.action = "CrearCuenta";
        formulario.method = "post";
        formulario.elements[0].value = "crearcuenta";
        formulario.submit();
        
    }
    
}

function validarCuenta(respuesta) {
    
    e7 = document.getElementById('validar');
    e7.style.visibility = 'visible';
    e7.style.heigth = 80 + 'px';
    
    if (respuesta === 'usuarioexiste'){
        
        e7.innerHTML = "Ingrese otro Usuario.";
        
    }else if (respuesta === 'passexiste'){
        
        e7.innerHTML = "Ingrese otra Contraseña.";
        
    } else if (respuesta === 'cuentaexitosa') {
        
        e7.innerHTML = "Cuenta creada exitosamente.";
        setTimeout(function () {
            e7.style.visibility = 'hidden';
            formulario = document.getElementById('formulario');
            formulario.action = "CrearCuenta";
            formulario.method = "post";
            formulario.elements[0].value = "cancelar";
            formulario.submit();
            
        }, 3000);
        
        setTimeout(function () {
            e7.style.visibility = 'hidden';
        }, 3000);
    }
    
    
    
    
}