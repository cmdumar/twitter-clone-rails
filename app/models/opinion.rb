class Opinion < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :content, length: { minimum: 5, maximum: 250 }
end
