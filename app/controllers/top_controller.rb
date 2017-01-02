class TopController < ApplicationController
  def index
    @q = Game.ransack(params[:q])
    @genres = Genre.all
    @tags = Game.tag_counts_on(:tags).order('count DESC')
  end
end
