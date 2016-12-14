class LikesController < ApplicationController
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
end
