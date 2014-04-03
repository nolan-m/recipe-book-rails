class Rating < ActiveRecord::Base
  belongs_to :recipe
  validates :score, presence: true
  validates :review, presence: true,
                     length: {minimum: 10, maximum: 140}
end
