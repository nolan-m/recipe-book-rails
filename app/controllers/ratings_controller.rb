class RatingsController < ApplicationController

  def create
    @recipe = Recipe.find_by(slug: params[:slug])
    @rating = @recipe.ratings.new(params[:rating])
    if @rating.save
      @recipe.save_score
      flash[:notice] = "Review was added."
      redirect_to("/recipes/#{@recipe.slug}")
    else
      render('recipes/show.html.erb')
    end
  end

end
