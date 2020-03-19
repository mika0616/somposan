class SolutionReport < ApplicationRecord
	# アソシエーション
	belongs_to :accident

	# バリデーション
	validates :body, presence: true
	validates :accident_id, uniqueness: true

end
