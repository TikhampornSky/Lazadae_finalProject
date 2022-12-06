require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @myrole = 'admin'
    @email = '0@gmail.com'
    @password = "0"
  end

  test "visiting the index" do
    visit '/login'
    fill_in "email", with: @email
    fill_in "password", with: @password

    click_on "Submit"
    assert_selector "h1", text: "Main Page of LAZADAE"
  end

end