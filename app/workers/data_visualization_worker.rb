class DataVisualizationWorker
  include Sidekiq::Worker

  attr_reader :import

  sidekiq_options retry: 0
  sidekiq_options queue: :visualization
  def perform(import_id)
    @import = Import.find(import_id)
    @import.status = :processing
    @import.save!
    # binding.pry
    # Ler o arquivo
    data_hash = JSON.parse(File.read(import.file.path))

    # binding.pry

    visualization = DataVisualization.new(
      cx: data_hash["colluns"]["cx"],
      cy: data_hash["colluns"]["cy"],
      r: data_hash["colluns"]["r"],
      cluster: data_hash["colluns"]["cluster"],
      data_id: data_hash["colluns"]["data_id"],
      import_id: import_id
    )
    unless visualization.save!
      error = Import.find(import_id)
      error.message = "Visualizaion out patther"
    else
      data_hash["values"].collect do |v|
        item = DataVisualizationItem.new(
          cx: v["cx"],
          cy: v["cy"],
          r: v["r"],
          cluster: v["cluster"],
          data_id: v["data_id"],
          data_visualization_id: visualization.id
        )
        unless item.save!
          error = Import.find(import_id)
          error.message = "VisualizaionItem out patther"
        else
          # binding.pry
          v["info"].collect do |i|
            info = DataVisualizationInfo.new(
              column: i["collun"],
              value: i["value"],
              data_visualization_item_id: item.id
            )
            info.save!
          end
        end
        @import.status = :done
        @import.save!
      end

    end
  end
end
