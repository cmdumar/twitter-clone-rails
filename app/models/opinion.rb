class Opinion < ApplicationRecord
  belongs_to :user

  validates :content, length: {minimum:5, maximum:250}
end
