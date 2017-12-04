# This migration comes from spree_loyalty_points (originally 20140117062720)
class AddTimestampsToLoyaltyPointsTransaction < ActiveRecord::Migration
  def change
    change_table :spree_loyalty_points_transactions do |t|
      t.timestamps
    end
  end
end
