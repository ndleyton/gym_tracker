class AddIntensityToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :intensity, :integer
  end
end
