require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  fixtures :all
  test "associated exercises should be destroyed" do
    exercise_type = ExerciseType.create!(name: "Push-up")
    routine = routines(:one) # This uses fixtures; replace with your setup if needed
    routine.exercises.create!(name: "Push-up", sets: 3, repetitions: 12, exercise_type: exercise_type) # Customize as needed

    assert_difference 'Exercise.count', -1 do
      routine.destroy
    end
  end
end
