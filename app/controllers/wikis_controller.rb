class WikisController < ApplicationController
  require 'redcarpet'

  def index
    @user = current_user
    # @wikis = Wiki.all
    @wikis = policy_scope(Wiki)
  end

  def show
    # @user = current_user
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
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


  def delete_collaborator
    @wiki = Wiki.find(params[:id])
    @user = User.find(params[:user_id])
    @wiki.user = current_user

    flash[:notice] = "Collaborating user was deleted successfully."

    @wiki.collaborating_users.delete(@user)
    redirect_to wiki_path
  end

  def add_collaborator
    @wiki = Wiki.find(params[:id])
    @user = User.find_by(email: params[:coll_email])
    @wiki.user = current_user

    if @user.nil?
      flash[:alert] = "User not found!"
      redirect_to wiki_path(@wiki)
      return
    end

    if @wiki.collaborating_users.include?(@user)
      flash[:alert] = "You're already a collaborator on this wiki!"
      redirect_to wiki_path(@wiki)
    else
      @wiki.collaborating_users << @user
      redirect_to wiki_path(@wiki), notice: "Collaborating user was added successfully."
    end
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
