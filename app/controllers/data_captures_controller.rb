class DataCapturesController < ApplicationController
  def show
    @data_capture = DataCapture.find(params[:id])
    render json: @data_capturer
  end
end
