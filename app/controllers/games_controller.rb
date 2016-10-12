class GamesController < ApplicationController
    def index
      @games = Game.all
      @softwares = @search_games.page(params[:page])
      @q = Game.ransack(params[:q])
    end
    
    def show
      @game = Game.find(params[:id])
    end
end