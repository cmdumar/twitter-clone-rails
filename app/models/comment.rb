class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates :text, length: { minimum: 5, maximum: 250 }
  validates :user_id, presence: true
  validates :opinion_id, presence: true
end
