class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table (:connections ) do |t|
      t.integer :Sequence_Number
      t.string :Client_Key
      t.string :Client_Secret
      t.string :Portal_Id
      t.string :Portal_Password
      t.string :Active_Field
      t.string :User_Field_String
      t.integer :User_Field_Integer
      t.datetime :User_Field_Datetime
      t.string :Transaction_Originator
      t.datetime :Transaction_Datetime
      t.string :Transaction_IP
      t.string :User_Updated
      t.datetime :Date_Updated
      t.string :IP_Updated

      t.timestamps
    end
  end
end

