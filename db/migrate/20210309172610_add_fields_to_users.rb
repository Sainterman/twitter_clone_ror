class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :followers, :integer, array: true
    add_column :users, :following, :integer, array: true
  end
end
