class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show edit update destroy ]

  # GET /imports or /imports.json
  def index
    @imports = Import.order("created_at DESC").page(params[:page]).per(10)
  end

  # GET /imports/1 or /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
    @cluster_info = ClusterInfo.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports or /imports.json
  def create
    @import = Import.new(
      file: import_params["file"],
      name: import_params["name"]
    )
    @import.user_id =  current_user.id
    @import.status = 0

    respond_to do |format|
      if @import.save
        @cluster_info = ClusterInfo.new(
          data_sets: import_params["cluster_info"]["data_sets"],
          algorithm: import_params["cluster_info"]["algorithm"],
          description: import_params["cluster_info"]["description"],
          type_algorithm_id: import_params["cluster_info"]["type_algorithm_id"]
        )
        @cluster_info.import_id = @import.id
        @cluster_info.save!

        DataVisualizationWorker.perform_async(@import.id)
        format.html { redirect_to @import, notice: "Importação foi criado." }
        format.json { render :show, status: :created, location: @import }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imports/1 or /imports/1.json
  def update
    @import.status = 0
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: "Import was successfully updated." }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1 or /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: "Import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_params
      params.require(:import).permit(
        :file,
        :name, 
        cluster_info: [
          :data_sets,
          :algorithm,
          :description,
          :type_algorithm_id
        ]
      )
    end
end
