# This migration comes from spree_marketing (originally 20160422080310)
class AddTypeColumnToSpreeMarketingLists < ActiveRecord::Migration
  def change
    add_column :spree_marketing_lists, :type, :string, index: true
  end
end
