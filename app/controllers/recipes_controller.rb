class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    render 'recipes/index.html.erb'
  end

  def create
    params[:recipe][:slug] = params[:recipe][:name].parameterize
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Recipe was added."
      redirect_to("/recipes/")
    else
      @recipes = Recipe.all
      render('recipes/index.html.erb')
    end
  end

  def show
    @recipe = Recipe.find_by(slug: params[:slug])
    render('show.html.erb')
  end

  def update
    @recipe = Recipe.find_by(slug: params[:slug])
    if @recipe.update(params[:recipe])
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
