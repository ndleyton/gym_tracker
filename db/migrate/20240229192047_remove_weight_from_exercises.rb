class RemoveWeightFromExercises < ActiveRecord::Migration[7.1]
  def change
    remove_column :exercises, :weight, :integer
  end
end
