class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @current_user = current_user
    @food = Food.new(food_params)
    @food.user = @current_user
    if @food.save!
      respond_to do |format|
        format.html { redirect_to foods_path, notice: 'Successfuly Created' }
        format.json { render :show, status: :cretaed, location: @food }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurment_unit)
  end
end
