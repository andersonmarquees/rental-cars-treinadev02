class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: 'Cliente registrado com sucesso'
    else
      render :new
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :email, :document)
    end
end
