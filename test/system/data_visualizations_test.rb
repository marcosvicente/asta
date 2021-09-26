require "application_system_test_case"

class DataVisualizationsTest < ApplicationSystemTestCase
  setup do
    @data_visualization = data_visualizations(:one)
  end

  test "visiting the index" do
    visit data_visualizations_url
    assert_selector "h1", text: "Data Visualizations"
  end

  test "creating a Data visualization" do
    visit data_visualizations_url
    click_on "New Data Visualization"

    fill_in "Cx", with: @data_visualization.cx
    fill_in "Cy", with: @data_visualization.cy
    fill_in "Id", with: @data_visualization.id
    fill_in "R", with: @data_visualization.r
    click_on "Create Data visualization"

    assert_text "Data visualization was successfully created"
    click_on "Back"
  end

  test "updating a Data visualization" do
    visit data_visualizations_url
    click_on "Edit", match: :first

    fill_in "Cx", with: @data_visualization.cx
    fill_in "Cy", with: @data_visualization.cy
    fill_in "Id", with: @data_visualization.id
    fill_in "R", with: @data_visualization.r
    click_on "Update Data visualization"

    assert_text "Data visualization was successfully updated"
    click_on "Back"
  end

  test "destroying a Data visualization" do
    visit data_visualizations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data visualization was successfully destroyed"
  end
end
