require 'faker'

namespace :seed do
  task :seed_msn do
    10.times do |i|
      Message.create(
        user: User.first,
        data_visualization: DataVisualization.last,
        content: "#{Faker::Name.name}"
      )
    end
  end
end
