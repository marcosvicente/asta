class DataVisualizationsController < ApplicationController

  # GET /data_visualizations or /data_visualizations.json
  def index
    @data_visualizations = DataVisualization.all
  end

  # GET /data_visualizations/1 or /data_visualizations/1.json
  def show
    id = DataVisualization.find(params[:id]).id

    categories =  DataVisualizationItem.where(
      data_visualization_id: id
    ).collect(&:cluster).uniq.reject(&:nil?)

    @data_visualization = []
    categories.each do |c|
      @data_visualization << ["cluster" => c, "itens" => DataVisualizationItem.where(cluster: c)]
    end
    @max =  DataVisualizationItem.where(data_visualization_id: id).max_by
    @min = DataVisualizationItem.where(data_visualization_id: id).min_by
    @data_visualization_info
    @data_visualization
  end

  def visualizations
    @data_visualization = DataVisualization.find(params[:id])
    # @item = DataVisualizationItem.where(
    #   data_visualization_id: params[:id]
    # )

    # @data_visualization = @data_visualization.as_json
    # @item = @item.as_json
    # @data_visualization.merge!({
    #   item: @item
    # })

    # @info = @info.as_json

    # @item.collect do |i|
    #   @info = DataVisualizationInfo.where(
    #     data_visualization_item_id: i["id"]
    #   )
    # end

    categories =  DataVisualizationItem.where(
      data_visualization_id: @data_visualization.id
    ).collect(&:cluster).uniq.reject(&:nil?)

    @data_visualization = []
    categories.each do |c|
      @data_visualization << [cluster: c, itens: DataVisualizationItem.where(cluster: c)]
    end

    render json: @data_visualization
  end
end
