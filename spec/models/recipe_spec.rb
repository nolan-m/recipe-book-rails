require 'spec_helper'

describe Recipe do
  it { should have_and_belong_to_many :tags }
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

  context "#current_tags" do
    it 'should list out the current tags' do
      recipe = Recipe.create(name: 'chocolate cookies', ingredients: "flour", directions: "mix")
      tag1 = recipe.tags.create(name: "desserts")
      tag2 = recipe.tags.create(name: "cookies")
      tag3 = Tag.create(name: "dinner")
      recipe.current_tags.should eq ([tag1, tag2])
    end
  end
end
