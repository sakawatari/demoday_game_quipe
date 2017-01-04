class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @recommends = Recommend.all.order(created_at: :desc)
    @my_like_recommends = current_user.likes.order(created_at: :desc)
    @my_recommends = current_user.recommends
  end

  def show
  end

  def new
    @recommend = Form::Recommend.new
  end

  def edit
  end

  def create
    @recommend = Form::Recommend.new(recommend_params)
    @recommend.user_id = current_user.id
    respond_to do |format|
      if @recommend.save
        format.html { redirect_to recommends_path, notice: '投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @recommend = Form::Recommend.find(params[:id])
    respond_to do |format|
      if @recommend.update_attributes(recommend_params)
        format.html { redirect_to recommend_path, notice: '編集しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @recommend.destroy
    respond_to do |format|
      format.html { redirect_to recommends_url, notice: '削除しました。' }
    end
  end

  def like
    recommend = Recommend.find(params[:recommend_id])
    like = current_user.likes.build(recommend_id: recommend.id)
    like.save
    redirect_to recommend
  end

  def unlike
    recommend = Recommend.find(params[:recommend_id])
    like = current_user.likes.find_by(recommend_id: recommend.id)
    like.destroy
    redirect_to recommend
  end

private
  def set_recommend
    @recommend = Form::Recommend.find(params[:id])
  end

  def recommend_params
    params.require(:form_recommend).permit(Form::Recommend::REGISTRABLE_ATTRIBUTES + [game_recommends_attributes: Form::GameRecommend::REGISTRABLE_ATTRIBUTES])
  end
end
