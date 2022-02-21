class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :memos, dependent: :destroy
  has_many :favorites
  has_many :favorite_memos, through: :favorites, source: :memo

  def favorite(memo)
    self.favorites.find_or_create_by(memo_id: memo.id)
  end
end
