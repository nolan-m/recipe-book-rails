class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    @tags = Tag.all
    render 'recipes/index.html.erb'
  end

  def create
    params[:recipe][:slug] = params[:recipe][:name].parameterize
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      Tag.where(id: params[:tags_id]).each do |tag|
        @recipe.tags << tag
      end
      flash[:notice] = "Recipe was added."
      redirect_to("/recipes/")
    else
      @recipes = Recipe.all
      render('recipes/index.html.erb')
    end
  end

  def show
    @recipe = Recipe.find_by(slug: params[:slug])
    @tags = Tag.all
    @rating = Rating.new
    @ratings = Rating.where(recipe_id: @recipe.id)
    render('show.html.erb')
  end

  def update
    params[:recipe][:slug] = params[:recipe][:name].parameterize
    @recipe = Recipe.find_by(slug: params[:slug])
    if @recipe.update(params[:recipe])
      @recipe.tags.each do |t|
        @recipe.tags.delete(t)
      end
      Tag.where(id: params[:tags_id]).each do |tag|
        @recipe.tags << tag
      end
      flash[:notice] = "Recipe was updated."
      redirect_to("/recipes/#{@recipe.slug}")
    else
      render('/recipes/show.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find_by(slug: params[:slug])
    @recipe.destroy
    redirect_to("/")
  end

end
