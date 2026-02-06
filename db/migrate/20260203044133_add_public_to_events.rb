class AddPublicToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :public, :boolean, null: false, default: true
  end
end
