
//      Materialize     //
/*
 * Tooltip
 * Modal
 * Select
 * Imagenes Box
 * Slider
 * Collapsible
 * Chips
 * Tabs
 * Floating Action Buttom
 * Validar Nueva Contraseña
 */
$(document).ready(function () {
    $('.tooltipped').tooltip();
    $('.modal').modal();
    $('select').formSelect();
    $('.materialboxed').materialbox();
    $('.slider').slider(
            {
                height: 256
            }
    );
    $('.collapsible').collapsible();
    $('.chips').chips();
    $('.tabs').tabs();
    $('.fixed-action-btn').floatingActionButton(
            {
                hoverEnabled: false,
                direction: 'left'
            });
    $('#mensaje_error').hide();
});

var cambioDePass = function() {
		var pass1 = $('#passContraseniaNueva').val();
    var pass2 = $('#passContraseniaConfirmar').val();
    if (pass1 == pass2) {
        $('#mensaje_error').show();
        $('#mensaje_error').html("Las constraseñas si coinciden");
    } else {
        $('#mensaje_error').show();
        $('#mensaje_error').html("Las constraseñas no coinciden");
    }
}

$("#passContraseniaNueva").on('keyup', cambioDePass);
$("#passContraseniaConfirmar").on('keyup', cambioDePass);
