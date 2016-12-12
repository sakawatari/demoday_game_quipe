class RecommendsController < ApplicationController
  before_action :set_recommend, only: [:show, :edit, :update, :destroy]

  # GET /recommends
  # GET /recommends.json
  def index
    @recommends = Recommend.all
  end

  # GET /recommends/1
  # GET /recommends/1.json
  def show
  end

  # GET /recommends/new
  def new
    @recommend = Recommend.new
  end

  # GET /recommends/1/edit
  def edit
  end

  # POST /recommends
  # POST /recommends.json
  def create
    @recommend = Recommend.new(recommend_params)
    @recommend.user_id = current_user.id
    respond_to do |format|
      if @recommend.save
        format.html { redirect_to @recommend, notice: '投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recommends/1
  # PATCH/PUT /recommends/1.json
  def update
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to @recommend, notice: '編集しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /recommends/1
  # DELETE /recommends/1.json
  def destroy
    @recommend.destroy
    respond_to do |format|
      format.html { redirect_to recommends_url, notice: '削除しました。' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommend
      @recommend = Recommend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommend_params
      params.require(:recommend).permit(:title, :content, :user_id)
    end
end
