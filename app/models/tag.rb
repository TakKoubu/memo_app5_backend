class Tag < ApplicationRecord
  belongs_to :memo
  has_many  :tag_memos, dependent: :destroy
  has_many  :memos, through: :tag_memos

  validates :memo_id, presence: true
  validates :name, uniqueness: true
end
