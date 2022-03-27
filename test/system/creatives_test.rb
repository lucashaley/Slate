require "application_system_test_case"

class CreativesTest < ApplicationSystemTestCase
  setup do
    @creative = creatives(:one)
  end

  test "visiting the index" do
    visit creatives_url
    assert_selector "h1", text: "Creatives"
  end

  test "should create creative" do
    visit creatives_url
    click_on "New creative"

    fill_in "Pitch", with: @creative.pitch_id
    fill_in "Position", with: @creative.position
    fill_in "User", with: @creative.user_id
    click_on "Create Creative"

    assert_text "Creative was successfully created"
    click_on "Back"
  end

  test "should update Creative" do
    visit creative_url(@creative)
    click_on "Edit this creative", match: :first

    fill_in "Pitch", with: @creative.pitch_id
    fill_in "Position", with: @creative.position
    fill_in "User", with: @creative.user_id
    click_on "Update Creative"

    assert_text "Creative was successfully updated"
    click_on "Back"
  end

  test "should destroy Creative" do
    visit creative_url(@creative)
    click_on "Destroy this creative", match: :first

    assert_text "Creative was successfully destroyed"
  end
end
