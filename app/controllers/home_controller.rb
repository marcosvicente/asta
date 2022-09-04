class HomeController < ApplicationController
  def index
  end

  def download_exemple_file
    send_file "#{Rails.root}/public/docs/download_exemplo.json", type: "application/json", x_sendfile: true
  end
end
