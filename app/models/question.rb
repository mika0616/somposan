class Question < ApplicationRecord
	# アソシエーション
	belongs_to :question_user
	has_many :favorites, dependent: :destroy
	belongs_to :accident
	has_many :question_tags, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_one :best_answer, dependent: :destroy
	has_many :tags, through: :question_tags

	# タグを利用するためにオプション
	acts_as_taggable # :tags のエイリアス

	#impressionistを利用するためのオプション
	is_impressionable counter_cache: true, :unique => :session_hash

	# バリデーション
	with_options presence: true do
		validates :title
		validates :body
	end

	# ステータス
	enum status: {"回答受付中": false, "解決済み": true}

	# 独自メソッド
	def favorited_by_question_user?(user)
			favorites.where(question_user_id: question_user.id).exists?
	end

end
