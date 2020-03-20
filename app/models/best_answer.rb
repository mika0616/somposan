class BestAnswer < ApplicationRecord
	#アソシエーション
	belongs_to :answer
	belongs_to :question
	has_one :answer_user, through: :answer
end
