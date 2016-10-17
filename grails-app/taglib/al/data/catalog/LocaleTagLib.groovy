package al.data.catalog

import org.springframework.web.servlet.support.RequestContextUtils;
import groovy.xml.MarkupBuilder
import sun.util.locale.BaseLocale;

class LocaleTagLib {
    static namespace = 'catalog'
    Locale aLocale = Locale.forLanguageTag("sq");
    List<Locale> locales = [aLocale, Locale.ENGLISH]

    /**
     * Renders a locale selector.
     * Adds the class <code>active</code> to the list-element of the current language.
     */
    def selector = {
        Locale requestLocale = RequestContextUtils.getLocale(request)

        MarkupBuilder mb = new MarkupBuilder(out)
        mb.ul('class': 'languages hoverSelectorBlock') {
            locales.each { Locale locale ->
                li(requestLocale.language == locale.language ? ['class': 'active'] : [:]) {
                    mb.yield(
                            link( controller: controllerName, action: actionName, params: params + [lang: locale.language],
                                    { locale.getDisplayLanguage(locale) } ).toString(),
                            false
                    )
                }
            }
        }
    }
}
