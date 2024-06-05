class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.integer   :user_id,     null: false
      t.integer   :part_id,     null: false
      t.integer   :exercise_id, null: false
      t.string    :name,        null: false
      t.text      :weight,      null: false
      t.integer   :rep,         null: false
      t.integer   :set,         null: false
      t.text      :memo
      t.timestamps
    end
  end
end
