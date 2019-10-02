class DataAnalysesController < ApplicationController
  before_action :initialize_data_analysis

  def preview
    if @data_analysis.valid?
      render json: { data: @data_analysis.data }
    else
      render json: { errors: @data_analysis.errors }
    end
  end

  def create
    if @data_analysis.save
      render json: { data: @data_analysis.data }
    else
      render json: { errors: @data_analysis.errors }
    end
  end

  private

  def analysis_params
    params.permit(:type, :threshold, :data_capture_id)
  end

  def initialize_data_analysis
    @data_analysis = DataAnalysis.new(analysis_params.to_h)
  end
end
