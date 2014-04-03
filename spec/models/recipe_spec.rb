require 'spec_helper'

describe Recipe do
  it { should have_and_belong_to_many :tags }
  it { should have_many :ratings }
  it { should validate_presence_of :name }
  it { should validate_presence_of :ingredients }
  it { should validate_presence_of :directions }
  it { should validate_uniqueness_of :name }

  context "#list_ing/#list_dir" do
    it 'should list out items between commas' do
      recipe = Recipe.create(name: 'cookies', ingredients: "flour\r\nsugar\r\neggs", directions: "mix\r\nbake\r\nenjoy")
      recipe.list_ing.should eq %w(flour sugar eggs)
      recipe.list_dir.should eq %w(mix bake enjoy)
    end
  end

  context "#save_score" do
    it 'should save the average score' do
      recipe = Recipe.create(name: 'chocolate cookies', ingredients: "flour", directions: "mix")
      score1 = recipe.ratings.create(score: 1)
      score2 = recipe.ratings.create(score: 5)
      recipe.save_score
      recipe.average_rating.should eq 3
    end
  end
end
