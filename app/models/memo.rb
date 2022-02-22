class Memo < ApplicationRecord
  attr_accessor :favorite_count

  has_many :favorites
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
end
