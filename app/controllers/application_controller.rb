class ApplicationController < ActionController::Base
    before_action :set_search
    
  def set_search
      @search = Game.ransack(params[:q])
      @search_games = @search.result(distinct: true)
  end
    protect_from_forgery with: :exception
end
