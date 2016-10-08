class GamesController < ApplicationController
  def index
      @games = Game.all
      @softwares = @search_games.page(params[:page])
      @q = Game.ransack(params[:q])
  end
end