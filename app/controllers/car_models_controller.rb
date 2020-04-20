class CarModelsController < ApplicationController

    before_action :set_car_model, only: [:show, :edit, :update, :destroy]

    def index
        @car_models = CarModel.all
    end

    def new
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
        @car_model = CarModel.new
    end

    def create
        @car_model = CarModel.new(car_model_params)
        if @car_model.save
            flash[:notice] = 'Categoria de carros cadastrado com sucesso'
            redirect_to @car_model
        else
            flash[:alert] = "Você deve informar todos os campos"
            @manufacturers = Manufacturer.all
            @car_categories = CarCategory.all
            render :new
        end
    end

    def show
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
    end

    def edit
        #
    end

    def update
        #
    end

    def destroy
        #
    end


    private
    def car_model_params
        params.require(:car_model).permit(:name, :year, :motorization, 
                                            :fuel_type, :manufacturer_id, 
                                            :car_category_id
                                        )
    end

    def set_car_model
        id = params[:id]
        @car_model = CarModel.find(id)
    end
end
