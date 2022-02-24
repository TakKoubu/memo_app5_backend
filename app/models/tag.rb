class Tag < ApplicationRecord
  belongs_to :memo
  validates :memo_id, presence: true
end
