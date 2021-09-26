require "test_helper"

class DataVisualizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_visualization = data_visualizations(:one)
  end

  test "should get index" do
    get data_visualizations_url
    assert_response :success
  end

  test "should get new" do
    get new_data_visualization_url
    assert_response :success
  end

  test "should create data_visualization" do
    assert_difference('DataVisualization.count') do
      post data_visualizations_url, params: { data_visualization: { cx: @data_visualization.cx, cy: @data_visualization.cy, id: @data_visualization.id, r: @data_visualization.r } }
    end

    assert_redirected_to data_visualization_url(DataVisualization.last)
  end

  test "should show data_visualization" do
    get data_visualization_url(@data_visualization)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_visualization_url(@data_visualization)
    assert_response :success
  end

  test "should update data_visualization" do
    patch data_visualization_url(@data_visualization), params: { data_visualization: { cx: @data_visualization.cx, cy: @data_visualization.cy, id: @data_visualization.id, r: @data_visualization.r } }
    assert_redirected_to data_visualization_url(@data_visualization)
  end

  test "should destroy data_visualization" do
    assert_difference('DataVisualization.count', -1) do
      delete data_visualization_url(@data_visualization)
    end

    assert_redirected_to data_visualizations_url
  end
end
