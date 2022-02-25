class CreateTagMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_memos do |t|
      t.references :memo, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tag_memos, [:memo_id, :tag_id], unique: true
  end
end
