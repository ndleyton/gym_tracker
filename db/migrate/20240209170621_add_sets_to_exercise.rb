class AddSetsToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :sets, :integer
  end
end
