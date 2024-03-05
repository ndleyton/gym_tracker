require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # TODO: fix tests
  setup do
    @exercise = exercises(:one)
    @user = users(:one) # Assuming you have a users fixture
    sign_in @user # If the controller requires authentication
    @exercise_type = exercise_types(:one) # Assuming you have an ExerciseType fixture
  end

  test "should get index" do
    get exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_url
    assert_response :success
  end

  test "should create exercise" do
    assert_difference("Exercise.count") do
      post exercises_url, params: { exercise: { name: "New Exercise", intensity: 5, sets: 3, repetitions: 12, intensity_measurement: "lbs", exercise_type_id: @exercise_type.id, notes: "Test notes" } }
    end

    assert_redirected_to exercise_url(Exercise.last)
  end

  test "should show exercise" do
    get exercise_url(@exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_url(@exercise)
    assert_response :success
  end

  test "should update exercise" do
    patch exercise_url(@exercise), params: { exercise: { intensity: 75, intensity_measurement: 'Kgs', sets: 3, repetitions: 12, exercise_type_id: @exercise_type.id, notes:"updated notes"} }
    assert_redirected_to exercise_url(@exercise)
    @exercise.reload
    assert_equal 75, @exercise.intensity
    assert_equal 'updated notes', @exercise.notes
  end

  test "should destroy exercise" do
    assert_difference("Exercise.count", -1) do
      delete exercise_url(@exercise)
    end

    assert_redirected_to exercises_url
  end
end
