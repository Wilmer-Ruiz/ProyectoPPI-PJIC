

//Verificar que hayan ingresado letras
function esVacio(str) {
    return (!str || str.length === 0);
}

function stringVacio(str) {
    return (!str || /^\s*$/.test(str)); //que me verifique desde principio a fin y que no hayan espacio.

}



//Para controlar el formulario, osea que todo lo ingresado
// sea verdadero.
function validar() {

    var estado = true;
    // para que el span se quite
    var tiempo = 2000;
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

    return estado;
}

//Para validar que los datos sean correctos o incorrectos.
function validarLogin(respuesta) {
    //e = elemento.
    e = document.getElementById('validar');
    // activar el span
    e.style.visibility = 'visible';
    //Estilos del mensaje de error
    e.style.heigth = 80 + 'px';

    if (respuesta === 'incorrecto') {
        e.innerHTML = "Contraseña Inválida </br>\n\
                       Usuario Inválido </br> \n\ \n\
                       Intente de Nuevo";

    } else if (respuesta === 'usuario-incorrecto') {

        e.innerHTML = "Usuario Inválido </br> Intente de Nuevo!";
    } else if (respuesta === 'password-incorrecto') {

        e.innerHTML = "Contraseña Inválida </br> Intente de Nuevo!";
    }
    setTimeout(function () {
        e.style.visibility = 'hidden';
    }, 3000);
}

function crearCuenta(){
    formulario = document.getElementById('crear-cuenta');
    formulario.action = "CrearCuenta";
    formulario.method = "post";
    formulario.submit();
    return false; 
};