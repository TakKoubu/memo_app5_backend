class AddStatusesToMemos < ActiveRecord::Migration[6.0]
  def change
    add_column :memos, :status, :string, default: 'inprogress', null: false
  end
end
