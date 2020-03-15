class Answer < ApplicationRecord
	# アソシエーション
	belongs_to :question
	belongs_to :answer_user
	has_one :best_answer, dependent: :destroy

	# バリデーション
	validates :body, presence: true
end
