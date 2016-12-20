class Form::GameRecommend < GameRecommend
  REGISTRABLE_ATTRIBUTES = %i(id game_id recommend_id _destroy)

  def selectable_games
    Game.all
  end
end
