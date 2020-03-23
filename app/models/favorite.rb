class Favorite < ApplicationRecord
	# アソシエーション
	belongs_to :question_user, optional: true
	belongs_to :answer_user, optional: true
	belongs_to :question
end
