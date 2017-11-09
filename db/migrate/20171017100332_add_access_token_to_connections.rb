class AddAccessTokenToConnections < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :Access_Token, :string
  end
end
