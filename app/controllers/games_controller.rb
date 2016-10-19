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
    
    def edit
        @game = Game.find(params[:id])
    end
    
    def update
        @game = Game.find(params[:id])
        respond_to do |format|
            if @game.update(game_params)
                format.html { redirect_to @game, notice: 'GameDate was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end
    
  private
    def game_params
        params.require(:game).permit(:tag_list)
    end
    
end