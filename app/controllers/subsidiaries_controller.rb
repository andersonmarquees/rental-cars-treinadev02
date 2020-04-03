class SubsidiariesController < ApplicationController

    before_action :set_subsidiary, only: [:show, :edit, :update, :destroy]
    
    def index
        @subsidiaries = Subsidiary.all
    end

    def new
        @subsidiary = Subsidiary.new
    end

    def create
        @subsidiary = Subsidiary.new(subsidiary_params)
        if @subsidiary.save
            redirect_to @subsidiary
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
        if @subsidiary.update(subsidiary_params)
            redirect_to @subsidiary
        else
            render :edit
        end
    end

    def destroy
        @subsidiary.destroy
        redirect_to @subsidiary
    end

    private

    def subsidiary_params
        params.require(:subsidiary).permit(:name, :cnpj, :address)
    end

    def set_subsidiary
        id = params[:id]
        @subsidiary = Subsidiary.find(id)
    end
end
