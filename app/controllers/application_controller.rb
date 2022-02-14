class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit

  around_action :switch_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]
    return locale if I18n.available_locales.map(&:to_s).include?(locale)

    # If locale isn't supported
    nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
