class FoodEntriesController < ApplicationController
    
    def index
        @entries = FoodEntry.all 
        render json: @entries
    end

    def show
        @entry = FoodEntry.find(params[:id])
        render json: @entry
    end

    def create
        @foodentry = FoodEntry.create(food_params)
        render json: @foodentry
    end

    private

    def food_params
        params.permit(:user_id, :food_id)
    end
end
