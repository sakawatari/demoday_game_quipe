class GamesController < ApplicationController
    def index
      @games = Game.all
      @softwares = @search_games.page(params[:page])
      @q = Game.ransack(params[:q])
    end
    
    def show
      @games = Game.all
      @game = Game.find(params[:id])
      @random = Game.offset( rand(Game.count) ).first
      @random_2 = Game.offset( rand(Game.count) ).first
      @random_3 = Game.offset( rand(Game.count) ).first
    end
end