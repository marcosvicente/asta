class DataVisualizationsController < ApplicationController
  before_action :set_data_visualization, only: %i[ show ]

  # GET /data_visualizations or /data_visualizations.json
  def index
    @data_visualizations = DataVisualization.all
  end

  # GET /data_visualizations/1 or /data_visualizations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_visualization
      @data_visualization = DataVisualization.find(params[:id])
    end
end
