class DataVisualizationsController < ApplicationController

  # GET /data_visualizations or /data_visualizations.json
  def index
    @data_visualizations = DataVisualization.order("created_at DESC").page(params[:page]).per(10)
  end

  # GET /data_visualizations/1 or /data_visualizations/1.json
  def show
    @data = DataVisualization.find(params[:id])
    @import = Import.find(@data.import_id)

    title = @import.name

    @cluster_info = ClusterInfo.where(import_id: @import.id).last

    @data_item = DataVisualizationItem.where( data_visualization_id: @data.id)

    categories =  DataVisualizationItem.where(
      data_visualization_id: @data.id
    ).collect(&:cluster).uniq.reject(&:nil?)

    @max =  DataVisualizationItem.where(data_visualization_id: @data.id).maximum("r")
    @min = DataVisualizationItem.where(data_visualization_id: @data.id).minimum("r")

    @data_visualization = []
    categories.each do |c|
      @data_visualization << ["cluster" => c, "itens" => DataVisualizationItem.where(cluster: c, data_visualization_id: @data.id)]
    end

    @data_visualization.map do |data|
      data[0]["itens"].map { |value| value["r_scale"] = (r_scale(value["r"], @max, @min))}
    end

    @data_visualization_columns = {
      title: title,
      xtitle: @data.cx,
      ytitle: @data.cy,
      data_labels: false,
      height: 500,
    }

    @data_visualization_info
    @data_visualization
  end

  private 
  def r_scale(r, max, min)
    limit_sup = 25
    limit_inf = 5
    value = 5 + (((r - min) * (limit_sup - limit_inf)) / (max - min))
  end
end
