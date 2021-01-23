class FavoritesController < ApplicationController

  def create
  	bagel = Bagel.find(params[:bagel_id])
    favorite = current_user.favorites.new(bagel_id: bagel.id)
    favorite.save
    redirect_to bagels_path
  end

  def destroy
  	bagel = Bagel.find(params[:bagel_id])
    favorite = current_user.favorites.find_by(bagel_id: bagel.id)
    favorite.destroy
    redirect_to bagels_path
  end

end
