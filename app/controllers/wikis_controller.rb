class WikisController < ApplicationController
  def index
    @user = current_user
    @wikis = Wiki.all
    # @wikis = policy_scope(Wiki)
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    # @wiki = Wiki.new(user: current_user)
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]
    # @wiki.private = params[:wiki][:body]
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki is now posted!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki post...please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]
    # @wiki.private = params[:wiki][:body]
    # @wiki.user = current_user

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki posting is now updated!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error updating the wiki...please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    # @user = current_user
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the wiki...please try again."
      render :show
    end
  end

private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
