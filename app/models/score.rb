class Score < ApplicationRecord
	# アソシエーション
	belongs_to :answer_user

	# カラム定義
	 enum event: {"回答投稿" =>0, "ベストアンサー獲得" =>1}
end
