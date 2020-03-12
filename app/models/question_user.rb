class QuestionUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :accidents, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# バリデーション
  with_options presence: true do
  	validates :name
  	validates :email
  	validates :password
  end

end
