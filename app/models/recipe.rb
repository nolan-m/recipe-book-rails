class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
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

  def current_tags

  end
end
