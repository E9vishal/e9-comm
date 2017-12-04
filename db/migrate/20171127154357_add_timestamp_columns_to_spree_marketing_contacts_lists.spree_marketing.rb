# This migration comes from spree_marketing (originally 20160422110751)
class AddTimestampColumnsToSpreeMarketingContactsLists < ActiveRecord::Migration
  def change
    change_table :spree_marketing_contacts_lists do |t|
      t.timestamps
    end
  end
end
