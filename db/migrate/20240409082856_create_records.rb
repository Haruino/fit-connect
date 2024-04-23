class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer   :user_id,   null: false
      t.string    :part,      null: false
      t.string    :exercise,  null: false
      t.integer   :weight,    null: false
      t.integer   :rep,       null: false
      t.integer   :set,       null: false
      t.text      :memo
      t.timestamps
    end
  end
end
