class DataVisualizationWorker
  include Sidekiq::Worker

  attr_reader :import

  sidekiq_options retry: 0
  sidekiq_options queue: :visualization

  def perform(import_id)
    @import = Import.find(import_id)
    change_status(@import, :processing)

    # binding.pry
    # read the file
    data_hash = JSON.parse(File.read(import.file.path))

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
      change_status(@import, :error)
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
          unless v["info"].nil?
            v["info"].collect do |i|
              info = DataVisualizationInfo.new(
                column: i["collun"],
                value: i["value"],
                data_visualization_item_id: item.id
              )
              info.save!
            end
          end
        end
        change_status(@import, :done)
      end

    end
  end

  private 
  def change_status(import, kind)
    import.status = kind
    import.save!
  end
end
