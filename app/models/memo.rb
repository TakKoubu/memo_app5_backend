class Memo < ApplicationRecord
  attr_accessor :favorite_count, :is_like
  belongs_to :user

  has_many :favorites
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships
  
  validates :user_id, presence: true
  validates :content, presence: true
end
