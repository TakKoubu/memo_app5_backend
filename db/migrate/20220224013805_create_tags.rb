class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :memo, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tags, [:memo_id, :created_at]
  end
end
