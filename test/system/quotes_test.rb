require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

 test "Creating a new quote" do
  visit quotes_path
  assert_selector "h1", text: "Quotes"

  click_on "New Quote"
  assert_selector "h1", text: "New quote"

  fill_in "Name", with: "Capybara quote"
  click_on "Create Quote"

  assert_selector "h1", text: "Quotes"
  assert_text "Capybara quote"
 end

 test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
 end

 test "Updating a quote" do
  visit quotes_path
  assert_selector "h1", text: "Quotes"

  click_on "Edit", match: :first
  assert_text "Edit quote"

  fill_in "Name", with: "Updated quote"
  click_on "Update Quote"

  assert_selector "h1", text: "Quotes"
  assert_text "Updated quote"
 end

 test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    accept_confirm("Are you sure?") do
      click_on "Delete", match: :first
    end
    assert_no_text @quote.name
 end
end
