class BestAnswer < ApplicationRecord
	#アソシエーション
	belongs_to :answer
	belongs_to :question

end
