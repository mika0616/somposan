class Skill < ApplicationRecord
	# アソシエーション
	belongs_to :answer_user
	
	# カラム定義
	enum status: {"退職済み": false, "現役社員": true}
	enum career: {"経験3年未満" =>0, "経験5年未満" =>1, "経験10年未満" =>2, "経験10年以上" =>3}
	enum speciality: {"物損担当" =>0, "ケガあり担当" =>1, "物損/ケガありマルチ担当" =>2}
	enum qualification: {"技術アジャスター3級" =>0, "技術アジャスター2級" =>1}
end
