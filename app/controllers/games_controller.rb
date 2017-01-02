class GamesController < ApplicationController
  before_action :set_game_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:edit]
  before_action :set_game, only: [:show, :edit, :update]
  before_filter :authenticate_user!, :except=>[:index, :show]

  def index
    @games = Game.all
    @softwares = @search_games.page(params[:page])
    @q = Game.ransack(params[:q])
    @tag_game = Game.tagged_with(params[:name])
  end

  def show
    @games = Game.all
    @random = Game.offset( rand(Game.count) ).first
    @random_2 = Game.offset( rand(Game.count) ).first
    @random_3 = Game.offset( rand(Game.count) ).first
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:tag_list, game_detail_attributes: [:id, :amazon, :yodobashi, :yahoo_shop, :official_store, :official_site, :wikipedia, :solution_site, :youtube, :niconico, :clear_time])
  end

  def set_game_tags_to_gon
    @game = Game.find(params[:id])
    gon.game_tags = @game.tag_list
  end

  def set_available_tags_to_gon
    gon.available_tags = Game.tags_on(:tags).pluck(:name)
  end
end
