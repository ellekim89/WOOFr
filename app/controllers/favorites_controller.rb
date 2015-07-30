class FavoritesController < ApplicationController
  before_action :check_auth
   protect_from_forgery :except => :show



  def create
    @favorite = DogsUsers.new({"dog_id" => params[:dog_id], "user_id" => session[:user_id]})
    @favorite.save

  end

  def show
    @dogs = DogsUsers.where user_id: session[:user_id]
  end


  def destroy
  end



end
