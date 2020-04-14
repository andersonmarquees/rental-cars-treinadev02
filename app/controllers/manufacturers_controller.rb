class ManufacturersController < ApplicationController

    before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

    before_action :authenticate_user!
    #before_action :authorize_admin
    
    def index
        @manufacturers = Manufacturer.all
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save
            redirect_to @manufacturer
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
        if @manufacturer.update(manufacturer_params)
            redirect_to @manufacturer
            flash[:notice] = "Fabricante editada com sucesso"
        else
            flash[:alert] = 'Nome já está em uso'
            render :edit
        end
    end

    def destroy
        @manufacturer.destroy
        redirect_to @manufacturer
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

    def set_manufacturer
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
    end

end
