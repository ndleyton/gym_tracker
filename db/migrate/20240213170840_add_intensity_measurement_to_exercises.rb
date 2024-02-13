class AddIntensityMeasurementToExercises < ActiveRecord::Migration[7.1]
  def change
    add_column :exercises, :intensity_measurement, :string
  end
end
