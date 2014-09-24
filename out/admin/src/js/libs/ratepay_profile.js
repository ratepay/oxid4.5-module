/**
 * Created with JetBrains PhpStorm.
 * User: aarne
 * Date: 16.09.14
 * Time: 15:12
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    $.each(countries, function(n, country) {
        if($.inArray(country, activeCountries) < 0) {
            $('#rp_country_fieldset_' + country).hide();
        }

        $.each(methods, function(n, method) {
            // Initializing hidden/visible forms
            if(!$('#rp_active_' + method + '_' + country).attr('checked')){
                $('#rp_fieldset_' + method + '_' + country).hide();
            }
            $('#rp_details_fieldset_' + method + '_' + country).hide();

            // Catching events
            $('#rp_country_active_' + country).click(function() {
                _switchCountry(country);
            });
            $('#rp_active_' + method + '_' + country).click(function() {
                _switchPaymentMethod(method, country);
            });
            if($('#rp_details_link_' + method + '_' + country).length > 0) {
                $('#rp_details_link_' + method + '_' + country).click(function() {
                    _switchDetails(method, country);
                });
            }
        });
    });

});

function _switchPaymentMethod(method, country) {
    checkbox = '#rp_active_' + method + '_' + country;
    fieldset = '#rp_fieldset_' + method + '_' + country;
    if($(checkbox).attr('checked')){
        $(fieldset).slideDown(100);
    }else{
        $(fieldset).slideUp(100);
    }
}

function _switchDetails(method, country) {
    fieldset = '#rp_details_fieldset_' + method + '_' + country;
    if($(fieldset).is(':visible')){
        $(fieldset).slideUp(100);
    }else{
        $(fieldset).slideDown(100);
    }
}

function _switchCountry(country) {
    checkboxCountry = '#rp_country_active_' + country;
    fieldset = '#rp_country_fieldset_' + country;
    if($(checkboxCountry).attr('checked')){
        $(fieldset).slideDown(100);
    }else{
        $(fieldset).slideUp(100);
    }
}