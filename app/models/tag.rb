class Tag < ApplicationRecord
  belongs_to :memo
  validates :memo_id, presence: true
  validates :name, uniqueness: true
  has_many  :tag_relationships, dependent: :destroy
  has_many  :memos, through: :tag_relationships
end
