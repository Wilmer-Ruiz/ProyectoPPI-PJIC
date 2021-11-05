
function llamarServlet(idFormulario) {

    formulario = document.getElementById(idFormulario);
    formulario.action = "Ecoparques";
    formulario.method = "post";
    formulario.submit();


}

function cancelar() {
    var ventana = document.getElementById("ventana-emergente");
    ventana.style.display = "none";
}


function insertar() {
    var ventana = document.getElementById("ventana-emergente");
    ventana.style.display = "block";
    var formulario = document.getElementById("formulario-insertar");
    //para que se quite la info que estaba anteriormente
    formulario.reset();
}

//Para verificar si el campo que se ingreso es vacio
function esVacio(str) {
    return (!str || str.length === 0);
}

//Verificar si se ingreso un string vacio = espacios en blanco
function stringVacio(str) {
    return (!str || /^\s*$/.test(str));
}

function insertar2() {
    //atrapar los campos de los tipos input
    var nombre = document.querySelector('[name=nombre]').value;
    var ubicacion = document.querySelector('[name=ubicacion]').value;
    var informacion = document.querySelector('[name=informacion]').value;
    var ruta = document.querySelector('[name=ruta]').value;
    var img = document.querySelector('[name=img]').value;

    if ((!esVacio(nombre) || stringVacio(nombre)) &&
            (esVacio(ubicacion) || stringVacio(ubicacion)) &&
            (esVacio(informacion) || stringVacio(informacion)) &&
            (esVacio(ruta) || stringVacio(ruta)) &&
            (esVacio(img) || stringVacio(img))) {

        var mensaje = document.getElementById("area-mensaje");
        mensaje.style.display = 'block';
        mensaje.style.color = 'black';
        mensaje.innerHTML = "Debe ingresar el nombre <br/>la ubicación, <br/>la información, <br/>y la ruta";
        setTimeout(function () {
            mensaje.style.display = 'none';
        }, 3000);
    } else {
        /* Hacer mayuscula la primera letra*/
        document.querySelector('[name=nombre]').value
                = nombre.charAt(0).toUpperCase() + nombre.slice(1);

        formulario = document.getElementById('formulario-insertar');
        formulario.action = "Servidor2";
        formulario.method = "post";
        formulario.submit();
    }
}



function cargarDatos(id, nombre, ubicacion, informacion, ruta, img) {

    //capturar por ID
    var ventana = document.getElementById("ventana-emergente-editar");
    ventana.style.display = "block";

    //Pasarle los datos al formulario y que aparezcan en pantalla
    //capturar por nombre
    document.querySelector('[name=nombreedit]').value = nombre;
    document.querySelector('[name=ubicacionedit]').value = ubicacion;
    document.querySelector('[name=informacionedit]').value = informacion;
    document.querySelector('[name=rutaedit]').value = ruta;
    document.querySelector('[name=imgedit]').value = img;

    var cancelar = document.getElementById("cancelar");
    cancelar.onclick = function () {
        ventana.style.display = "none";
    };

    var eliminar = document.getElementById("eliminar");
    eliminar.onclick = function () {
        formulario = document.getElementById("formulario-editar");
        formulario.action = "Servidor2";
        formulario.method = "post";
        formulario.elements["pagina"].value = "eliminar";
        formulario.elements["id"].value = id;
        formulario.submit();
    };

    var actualizar = document.getElementById("actualizar");
    actualizar.onclick = function () {

        var nom = document.querySelector('[name=nombreedit]').value;
        var ubi = document.querySelector('[name=ubicacionedit]').value;
        var info = document.querySelector('[name=informacionedit]').value;
        var rut = document.querySelector('[name=rutaedit]').value;
        var imge = document.querySelector('[name=imgedit]').value;

        if (nom !== nombre ||
                ubi !== ubicacion ||
                info !== informacion ||
                rut !== ruta ||
                imge !== img){

            if (esVacio(nom) || stringVacio(nom) ||
                    esVacio(ubi) || stringVacio(ubi) ||
                    esVacio(info) || stringVacio(info) ||
                    esVacio(rut) || stringVacio(rut) ||
                    esVacio(imge) || stringVacio(imge)) {

                var mensaje = document.getElementById("area-mensaje-editar");
                mensaje.style.display = 'block';
                mensaje.style.color = 'black';
                mensaje.innerHTML = "Debe ingresar todos los campos.";
                setTimeout(function () {
                    mensaje.style.display = 'none';
                }, 3000);

            } else {
                
                formulario = document.getElementById("formulario-editar");
                formulario.action = "Servidor2";
                formulario.method = "post";
                formulario.elements["pagina"].value = "editar";
                formulario.elements["id"].value = id;
                formulario.submit();
            }

        } else {

            var mensaje = document.getElementById("area-mensaje-editar");
            mensaje.style.display = 'block';
            mensaje.style.color = 'black';
            mensaje.innerHTML = "Debe cambiar un dato para<br/>hacer la actualizacion.";
            setTimeout(function () {
                mensaje.style.display = 'none';
            }, 3000);
        }


    };

}