# This migration comes from spree_marketing (originally 20160422110608)
class AddTimestampColumnsToSpreeMarketingLists < ActiveRecord::Migration
  def change
    change_table :spree_marketing_lists do |t|
      t.timestamps
    end
  end
end
