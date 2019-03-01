class AddLevelToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :level, :integer
  end
end
