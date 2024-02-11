class AddRepetitionsToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :repetitions, :integer
  end
end
