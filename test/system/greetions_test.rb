require "application_system_test_case"

class GreetionsTest < ApplicationSystemTestCase
  setup do
    @greetion = greetions(:one)
  end

  test "visiting the index" do
    visit greetions_url
    assert_selector "h1", text: "Greetions"
  end

  test "creating a Greetion" do
    visit greetions_url
    click_on "New Greetion"

    fill_in "Message", with: @greetion.message
    fill_in "Name", with: @greetion.name
    click_on "Create Greetion"

    assert_text "Greetion was successfully created"
    click_on "Back"
  end

  test "updating a Greetion" do
    visit greetions_url
    click_on "Edit", match: :first

    fill_in "Message", with: @greetion.message
    fill_in "Name", with: @greetion.name
    click_on "Update Greetion"

    assert_text "Greetion was successfully updated"
    click_on "Back"
  end

  test "destroying a Greetion" do
    visit greetions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Greetion was successfully destroyed"
  end
end
