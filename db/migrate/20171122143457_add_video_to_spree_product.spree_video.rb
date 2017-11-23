# This migration comes from spree_video (originally 20151021204937)
class AddVideoToSpreeProduct < ActiveRecord::Migration
  def change
  	add_attachment :spree_products, :video
  end
end
