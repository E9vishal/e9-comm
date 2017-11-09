module Spree
  class Role < Spree::Base
  	has_and_belongs_to_many :users, join_table: 'spree_roles_users', class_name: Spree.user_class.to_s
    has_many :role_users, class_name: 'Spree::RoleUser', dependent: :destroy
    has_many :users, through: :role_users, class_name: Spree.user_class.to_s

    validates :name, presence: true, uniqueness: { allow_blank: true }
  end
end