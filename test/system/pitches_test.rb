require "application_system_test_case"

class PitchesTest < ApplicationSystemTestCase
  setup do
    @pitch = pitches(:one)
  end

  test "visiting the index" do
    visit pitches_url
    assert_selector "h1", text: "Pitches"
  end

  test "should create pitch" do
    visit pitches_url
    click_on "New pitch"

    fill_in "Core creatives", with: @pitch.core_creatives_id
    fill_in "Logline", with: @pitch.logline_id
    fill_in "Presentation datetime", with: @pitch.presentation_datetime
    fill_in "Slides", with: @pitch.slides
    fill_in "Synopsis", with: @pitch.synopsis
    fill_in "Tagline", with: @pitch.tagline_id
    fill_in "Title", with: @pitch.title_id
    fill_in "User", with: @pitch.user_id
    click_on "Create Pitch"

    assert_text "Pitch was successfully created"
    click_on "Back"
  end

  test "should update Pitch" do
    visit pitch_url(@pitch)
    click_on "Edit this pitch", match: :first

    fill_in "Core creatives", with: @pitch.core_creatives_id
    fill_in "Logline", with: @pitch.logline_id
    fill_in "Presentation datetime", with: @pitch.presentation_datetime
    fill_in "Slides", with: @pitch.slides
    fill_in "Synopsis", with: @pitch.synopsis
    fill_in "Tagline", with: @pitch.tagline_id
    fill_in "Title", with: @pitch.title_id
    fill_in "User", with: @pitch.user_id
    click_on "Update Pitch"

    assert_text "Pitch was successfully updated"
    click_on "Back"
  end

  test "should destroy Pitch" do
    visit pitch_url(@pitch)
    click_on "Destroy this pitch", match: :first

    assert_text "Pitch was successfully destroyed"
  end
end
