class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @search = Game.ransack(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @search_games = @search.result(distinct: true)
  end

  PERMISSIBLE_ATTRIBUTES = %i(name)

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end
end
