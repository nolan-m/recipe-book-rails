class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :ratings
  validates :name, presence: true,
                   uniqueness: true
  validates :directions, presence: true
  validates :ingredients, presence: true
  def list_ing
    list = self.ingredients.split /[\r\n]+/
  end

  def list_dir
    list = self.directions.split /[\r\n]+/
  end

  def save_score
    total = 0
    self.ratings.each { |r| total += r.score }
    self.update(average_rating: (total/self.ratings.size))
  end
end
