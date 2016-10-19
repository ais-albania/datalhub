/**
 * Created by arb on 20.10.2016.
 */
if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(window).bind("load", function () {
            $('label[for="digitalData"]').parent().prop("hidden", "hidden");
            $('label[for="folder"]').parent().prop("hidden", "hidden");
        });
    })(jQuery);
}