class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @message = Message.new(msg_params)
    @message.user_id = current_user.id
    if @message.save
      Rails.logger.info "create Message"
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end

  private

  def msg_params
    params.require(:message).permit(:content, :data_visualization_id, :user_id)
  end
end
