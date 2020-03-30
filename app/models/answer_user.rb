class AnswerUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :skill, dependent: :destroy
  has_many :best_answers, through: :answers
  has_many :scores, dependent: :destroy


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
  enum qualification: {"技術アジャスター資格なし" =>0, "技術アジャスター3級" =>1, "技術アジャスター2級" =>2}


  def update_level
    if self.total_score > 200
      self.update(level: "レベル２")
    elsif self.total_score > 400
      self.update(level: "レベル３")
    elsif self.total_score > 600
      self.update(level: "レベル４")
    elsif self.total_score > 800
      self.update(level: "レベル５")
    elsif self.total_score > 1000
      self.update(level: "レベルMAX")
    end
  end

end
