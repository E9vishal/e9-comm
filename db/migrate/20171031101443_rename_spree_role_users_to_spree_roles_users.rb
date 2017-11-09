class RenameSpreeRoleUsersToSpreeRolesUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_table :spree_role_users, :spree_roles_users
  end
end
