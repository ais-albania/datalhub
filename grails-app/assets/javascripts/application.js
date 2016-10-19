// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require plugins/jquery-migrate.min
//= require plugins/back-to-top
//= require custom
//=require plugins/jssocials.min
//= require app
//= require_self

if (typeof jQuery !== 'undefined') {
    $.noConflict();
    (function($) {
        $("#share").jsSocials({
            shares: ["email", "twitter", "facebook", "googleplus", "linkedin", "pinterest", "stumbleupon", "whatsapp"]
        });

        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
        App.init();

    })(jQuery);
}
