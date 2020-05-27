class AddDefaultValueToView < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :view, :integer, default: 0
  end
end
