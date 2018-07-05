class AddColumnsToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string
    add_column :users, :following, :integer
    add_column :users, :followers, :integer
    add_column :users, :name, :string
    add_column :users, :avatar_url, :string
    add_column :users, :bio, :string
    add_column :users, :total_public_repos, :integer
    add_column :users, :total_private_repos, :integer
    add_column :users, :collaborators, :integer
    add_column :users, :location, :string
    add_column :users, :html_url, :string
  end
end
