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

  def schedule
    if params[:date].present?
      @select_schedule = Game.where(['released_date LIKE ?', "%#{params[:date][:year] + "年" + params[:date][:month] + "月"}%"]).order(:released_date)
    else
      @select_schedule = Game.where(['released_date LIKE ?', "%#{Time.now.year.to_s + "年" + Time.now.month.to_s + "月"}%"]).order(:released_date)
    end
    @schedules_12 = Game.where(['released_date LIKE ?', "%#{"2016年12月"}%"]).order(:released_date)
    @schedules_11 = Game.where(['released_date LIKE ?', "%#{"2016年11月"}%"]).order(:released_date)
    @schedules_rdd = Game.where(['released_date LIKE ?', "%#{"未定"}%"]).order(:released_date)
  end

  def database
    @my_stocks = current_user.stocks
    @my_favorites = current_user.favorites
    @my_like_recommends = current_user.likes.order(created_at: :desc)
    @my_recommends = current_user.recommends.order(created_at: :desc)
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
