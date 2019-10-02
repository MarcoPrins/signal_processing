class DataCapturesController < ApplicationController
  def show
    @data_capture = DataCapture.find(params[:id])
    render json: { data: @data_capture }
  end
end
