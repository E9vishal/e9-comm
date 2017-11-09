class ConnectionsController < ApplicationController
	skip_before_action :verify_authenticity_token
  def index
  	@connections = Connection.all
  end

  def new
  	@connection = Connection.new
  end

  def show
  	@connection = Connection.find(params[:id])
  end

  def edit
    @connection = Connection.find(params[:id])
  end

  def destroy
  	@connection = Connection.find(params[:id])
  	@connection.destroy
  	redirect_to connections_path
  end

  def create
  	@connection = Connection.new(connection_params)
  	if @connection.save
  		redirect_to connections_path
  	else
  		render 'new'
  	end
  end

  def update
    @connection = Connection.find(params[:id])
    
    if @connection.update_attributes(connection_params)
      redirect_to connections_path
    else
      render 'edit'
  end
end

  private

  def connection_params
  	params.require(:connection).permit(:Sequence_Number, :Client_Key, :Client_Secret, :Portal_Id, :Portal_Password, :Active_Field, :Ecomm_instance_name)
  end

end
