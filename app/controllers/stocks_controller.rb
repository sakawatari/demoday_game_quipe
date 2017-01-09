class StocksController < ApplicationController
  def create
    @stock = Stock.create(user_id: current_user.id, game_id: params[:game_id])
    @stocks = Stock.where(game_id: params[:game_id])
    @games = Game.all
  end
  def destroy
    stock = Stock.find_by(user_id: current_user.id, game_id: params[:game_id])
    stock.destroy
    @stocks = Stock.where(game_id: params[:game_id])
    @games = Game.all
  end
end
