#' PhoneNumberProvider
#'
#' @export
#' @keywords internal
#' @param locale (character) the locale to use. See
#' `phone_number_provider_locales` for locales supported (default: en_US)
#' @details
#' **Methods**
#'
#' - `render()` - Make a phone number
#'
#' @format NULL
#' @usage NULL
#' @examples
#' z <- PhoneNumberProvider$new()
#' z$render()
#'
#' PhoneNumberProvider$new(locale = "fr_FR")$render()
#' PhoneNumberProvider$new(locale = "sk_SK")$render()
#' 
#' # locales with area codes
#' PhoneNumberProvider$new(locale = "en_AU")$render()
#' PhoneNumberProvider$new(locale = "en_NZ")$render()
PhoneNumberProvider <- R6::R6Class(
  inherit = BaseProvider,
  'PhoneNumberProvider',
  public = list(
    locale = NULL,
    formats = phone_number_formats_en_us,
    area_code_formats = NULL,

    initialize = function(locale = NULL) {
      if (!is.null(locale)) {
        # check locale globally supported
        super$check_locale(locale)
        # check job provider locales
        check_locale_(locale, phone_number_provider_locales)
        self$locale <- locale
      } else {
        self$locale <- 'en_US'
      }
      self$formats <- parse_eval("phone_number_formats_", self$locale)
      self$area_code_formats <- 
        parse_eval("area_codes_formats_", self$locale)
    },

    render = function() {
      if (!is.null(self$area_code_formats)) {
        return(super$numerify(
          whisker::whisker.render(super$random_element(self$formats),
          data = list(area_code = super$random_element(self$area_code_formats)))
        ))
      }
      super$numerify(text = super$random_element(self$formats))
    }
  )
)

#' @export
#' @rdname PhoneNumberProvider
phone_number_provider_locales <- c(
  "en_US", "es_ES", "es_MX", "en_GB", "en_CA", "el_GR", "da_DK",
  "de_DE", "cs_CZ", "bs_BA", "bg_BG", "fa_IR", "fi_FI", "fr_CH",
  "fr_FR", "hi_IN", "hr_HR", "hu_HU", "it_IT", "ja_JP", "ko_KR",
  "lt_LT", "lv_LV", "ne_NP", "nl_BE", "nl_NL", "no_NO", "pl_PL",
  "pt_BR", "pt_PT", "ru_RU", "sk_SK", "sl_SL", "sv_SE", "tr_TR",
  "uk_UA", "zh_TW", "dk_DK", "he_IL", "id_ID", "en_AU", "en_NZ",
  "th_TH", "tw_GH"
)
# zh_CN
