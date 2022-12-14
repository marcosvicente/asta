class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show edit update ]

  # GET /imports or /imports.json
  def index
    @imports = Import.order("created_at DESC").where(archived: false).page(params[:page]).per(10)
  end

  # GET /imports/1 or /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
    @import.build_cluster_info
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports or /imports.json
  def create
    @import = Import.new(import_params)
    @import.user_id = current_user.id
    
    respond_to do |format|
      if @import.save
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

  def archived
    unless params[:id].nil?
      import = Import.find(params[:id])
      import.archived = true
      import.save
      redirect_to import, notice: "Importation archived"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    def import_params
      params.require(:import).permit(
        :file,
        :name, 
        cluster_info_attributes: [
          :id,
          :data_sets,
          :algorithm,
          :description,
          :type_algorithm_id
        ]
      )
    end
end
