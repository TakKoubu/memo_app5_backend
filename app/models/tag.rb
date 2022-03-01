class Tag < ApplicationRecord
  has_many  :tag_memos
  has_many  :memos, through: :tag_memos

  validates :name, uniqueness: true
end
