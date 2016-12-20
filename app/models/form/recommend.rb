class Form::Recommend < Recommend
  REGISTRABLE_ATTRIBUTES = %i(id title content user_id game_recommend_id)

  has_many :game_recommends, class_name: 'Form::GameRecommend'
end
