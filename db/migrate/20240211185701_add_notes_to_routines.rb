class AddNotesToRoutines < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :notes, :string
  end
end
