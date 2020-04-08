class CarCategoriesController < ApplicationController

    before_action :set_car_category, only: [:show, :edit, :update, :destroy]

    def index
        @car_categories = CarCategory.all
    end

    def new
        @car_category = CarCategory.new
    end

    def create
        @car_category = CarCategory.new(car_category_params)
        if @car_category.save
            redirect_to @car_category
        else
            flash.now[:alert] = 'Você deve informar todos os campos'
            render :new
        end
    end

    def show
    
    end

    def edit
        
    end

    def update
        if @car_category.update(car_category_params)
            redirect_to @car_category
            flash[:notice] = "Categoria editada com sucesso"
        else
            flash[:alert] = 'Há campos em está em uso'
            render :edit
        end
    end
    
    def destroy
        @car_category.destroy
        redirect_to @car_category    
    end

    private

    def car_category_params
        params.require(:car_category).permit(:name, :daily_rate, :car_insurance, 
                                        :third_party_insurance)
    end
    
    def set_car_category
        id = params[:id]
        @car_category = CarCategory.find(id)
    end
end

