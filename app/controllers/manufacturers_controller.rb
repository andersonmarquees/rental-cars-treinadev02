class ManufacturersController < ApplicationController

    #before_action :set_manufacturer, only [:new]

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
            render :new
        end
    end

    def show
        @manufacturer = Manufacturer.find(params[:id])
    end

    private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

    #def set_manufacturer
    #    @manufacturer = Manufacturer.new
    #end

end
