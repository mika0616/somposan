class AnswerUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :answer_user_skills, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true  do
  	validates :name
  	validates :email
  	validates :password
  end

  # レベル
  enum status: {"レベル１" => 0, "レベル２" => 1, "レベル３" => 2, "レベル４" => 3, "レベル５" => 4, "レベルMAX" => 5}
end
