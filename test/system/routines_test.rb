require "application_system_test_case"

class RoutinesTest < ApplicationSystemTestCase
  setup do
    @routine = routines(:one)
  end

  test "visiting the index" do
    visit routines_url
    assert_selector "h1", text: "Routines"
  end

  test "should create routine" do
    visit routines_url
    click_on "New routine"

    click_on "Create Routine"

    assert_text "Routine was successfully created"
    click_on "Back"
  end

  test "should update Routine" do
    visit routine_url(@routine)
    click_on "Edit this routine", match: :first

    click_on "Update Routine"

    assert_text "Routine was successfully updated"
    click_on "Back"
  end

  test "should destroy Routine" do
    visit routine_url(@routine)
    click_on "Destroy this routine", match: :first

    assert_text "Routine was successfully destroyed"
  end
end
