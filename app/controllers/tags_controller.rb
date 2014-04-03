class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
    render 'tags/index.html.erb'
  end

  def create
    params[:tag][:slug] = params[:tag][:name].parameterize
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Tag was added."
      redirect_to("/tags/")
    else
      @tags = Tag.all
      render('tags/index.html.erb')
    end
  end

  def show
    @tag = Tag.find_by(slug: params[:slug])
    render('show.html.erb')
  end

  def update
    params[:tag][:slug] = params[:tag][:name].parameterize
    @tag = Tag.find_by(slug: params[:slug])
    if @tag.update(params[:tag])
      flash[:notice] = "Tag was updated."
      redirect_to("/tags/#{@tag.slug}")
    else
      render('/tags/show.html.erb')
    end
  end

  def destroy
    @tag = Tag.find_by(slug: params[:slug])
    @tag.destroy
    redirect_to("/tags")
  end

end
