class AddOwnerAndImageIdsToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :owner_id, :integer, null: false
    add_column :groups, :image_id, :string
  end
end
