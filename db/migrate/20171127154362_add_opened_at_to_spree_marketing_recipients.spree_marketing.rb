# This migration comes from spree_marketing (originally 20160517103814)
class AddOpenedAtToSpreeMarketingRecipients < ActiveRecord::Migration
  def change
    add_column :spree_marketing_recipients, :email_opened_at, :datetime, index: true
  end
end
