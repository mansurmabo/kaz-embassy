class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied(exception)
    redirect_to admin_root_path, :alert => exception.message
  end

  around_action :with_locale

  private

  def with_locale
    I18n.with_locale(params[:locale]) { yield }
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
end
