class DataVisualizationsController < ApplicationController

  # GET /data_visualizations or /data_visualizations.json
  def index
    @data_visualizations = DataVisualization.order("created_at DESC").page(params[:page]).per(10)
  end

  # GET /data_visualizations/1 or /data_visualizations/1.json
  def show
    id = DataVisualization.find(params[:id]).id

    categories =  DataVisualizationItem.where(
      data_visualization_id: id
    ).collect(&:cluster).uniq.reject(&:nil?)


    @max =  DataVisualizationItem.where(data_visualization_id: id).maximum("r")
    @min = DataVisualizationItem.where(data_visualization_id: id).minimum("r")

    @data_visualization = []
    categories.each do |c|
      @data_visualization << ["cluster" => c, "itens" => DataVisualizationItem.where(cluster: c, data_visualization_id: id)]
    end

    

    @data_visualization.map do |data|
      data[0]["itens"].map { |value| value["r_scale"] = (r_scale(value["r"], @max, @min))}
    end

    @data_visualization_info
    @data_visualization
  end

  private 
  
  def r_scale(r, max, min)
    value = 5 + (((r - min) * (25)) / (max - min))
  end
end
