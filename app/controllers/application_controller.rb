class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_paper_trail_whodunnit
  # around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
