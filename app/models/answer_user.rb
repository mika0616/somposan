class AnswerUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :skill, dependent: :destroy
  has_many :best_answers, through: :answers


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true  do
  	validates :name
  	validates :email
  end

    # カラム定義
  enum level: {"レベル１" => 0, "レベル２" => 1, "レベル３" => 2, "レベル４" => 3, "レベル５" => 4, "レベルMAX" => 5}
  enum status: {"退職済み": false, "現役社員": true}
  enum career: {"経験3年未満" =>0, "経験5年未満" =>1, "経験10年未満" =>2, "経験10年以上" =>3}
  enum speciality: {"物損担当" =>0, "ケガあり担当" =>1, "物損/ケガありマルチ担当" =>2}
  enum qualification: {"技術アジャスター3級" =>0, "技術アジャスター2級" =>1}

  # 独自メソッド
    # ベストアンサーポイントを加算
    def add_best_answer_score
      self.score += 50
    end

    def count_best_answer
      count = 0
      if self.answers.best_answers.present?
        self.answers.each do |best_answer|
          count += best_answer.count
        end
      end
      count
    end

end
