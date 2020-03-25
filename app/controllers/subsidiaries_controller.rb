class SubsidiariesController < ApplicationController
    
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
        @subsidiary = Subsidiary.find(params[:id])
    end

    private

    def subsidiary_params
        params.require(:subsidiary).permit(:name, :cnpj, :address)
    end
end
#validates :name, :cnpj, uniqueness: {message: 'Nome ou CNPJ já está em uso'}