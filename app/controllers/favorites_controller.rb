class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, game_id: params[:game_id])
    @favorites = Favorite.where(game_id: params[:game_id])
    @games = Game.all
    redirect_to game_path(params[:game_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, game_id: params[:game_id])
    favorite.destroy
    @favorites = Favorite.where(game_id: params[:game_id])
    @games = Game.all
    redirect_to game_path(params[:game_id])
  end
end
