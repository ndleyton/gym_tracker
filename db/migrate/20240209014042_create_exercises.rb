class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :weight
      t.references :routine, null: false, foreign_key: true
      t.references :exercise_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
