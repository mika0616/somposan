class Accident < ApplicationRecord
	attachment :situation_img
	
	# アソシエーション
	has_one :solution_report, dependent: :destroy
	belongs_to :question_user

	# バリデーション
	with_options presence: true do
		validates :title
		validates :body
	end
end
