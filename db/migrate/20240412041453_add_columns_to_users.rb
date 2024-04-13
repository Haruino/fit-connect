class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :introduction, :text, null: true
    add_column :users, :active, :boolean, null: false, default: true
  end
end
