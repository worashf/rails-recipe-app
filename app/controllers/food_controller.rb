class FoodController < ApplicationController


    def new
        @food  = Food.new
    end
end
