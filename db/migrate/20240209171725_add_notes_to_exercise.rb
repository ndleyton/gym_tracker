class AddNotesToExercise < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :notes, :string
  end
end
