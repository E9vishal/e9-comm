# This migration comes from spree_loyalty_points (originally 20140123092709)
class AddPaidAtToSpreeOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :paid_at, :datetime
  end
end
