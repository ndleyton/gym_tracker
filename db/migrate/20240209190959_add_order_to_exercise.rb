class AddOrderToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :order, :integer
  end
end
