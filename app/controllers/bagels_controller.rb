class BagelsController < ApplicationController
  def new
  	@bagel = Bagel.new
  end

  def create
  	@bagel = Bagel.new(bagel_params)
    @user = current_user
    @bagel.user_id = current_user.id
    if @bagel.save
       redirect_to @bagel
    else
       render "new"
    end
  end

  def index
    @bagels = Bagel.all
    @user = current_user
  end

  def show
  	@bagel = Bagel.find(params[:id])
  	@user = @bagel.user
  end

  def edit
  	@bagel = Bagel.find(params[:id])
    if @bagel.user != current_user
       redirect_to bagels_path
    end
  end

  def update
  	@bagel = Bagel.find(params[:id])
    if @bagel.update(bagel_params)
       redirect_to bagel_path(@bagel.id)
    else
       render "edit"
    end
  end

  def destroy
  	bagel = Bagel.find(params[:id])
    bagel.destroy
    redirect_to bagels_path
  end

  private
  def bagel_params
    params.require(:bagel).permit(:user_id, :name, :image, :store, :price, :introduction)
  end

end
