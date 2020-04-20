class ClientsController < ApplicationController

    before_action :set_client, only: [:show]
    before_action :authenticate_user!

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        if @client.save
            flash[:notice] = 'Cliente cadastrado com sucesso'
            redirect_to @client
        else
            flash.now[:alert] = 'Você deve informar todos os campos'
            render :new
        end
    end

    def show
        
    end

    private

    def client_params
        params.require(:client).permit(:name, :document, :email)
    end

    def set_client
        id = params[:id]
        @client = Client.find(id)
    end
end
