class TopController < ApplicationController
    def index
        @q = Game.ransack(params[:q])
        @genres = Genre.all
    end
    
end