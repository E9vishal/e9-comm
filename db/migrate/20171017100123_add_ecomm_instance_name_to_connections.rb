class AddEcommInstanceNameToConnections < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :Ecomm_instance_name, :string
  end
end
