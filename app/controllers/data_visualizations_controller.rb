class DataVisualizationsController < ApplicationController

  # GET /data_visualizations or /data_visualizations.json
  def index
    @data_visualizations = DataVisualization.all
  end

  # GET /data_visualizations/1 or /data_visualizations/1.json
  def show
    @data_visualization = DataVisualization.find(params[:id])
  end

  def visualizations
    @data_visualization = DataVisualization.find(params[:id])
    @item = DataVisualizationItem.where(
      data_visualization_id: params[:id]
    )

    @data_visualization = @data_visualization.as_json
    @item = @item.as_json
   
    @data_visualization.merge!({
      item: @item
    })

    @info = @info.as_json

    @item.collect do |i|
      @info = DataVisualizationInfo.where(
        data_visualization_item_id: i["id"]
      )
    end
    
    render json: @data_visualization
  end
  
end
