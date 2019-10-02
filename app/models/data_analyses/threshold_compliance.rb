class DataAnalyses::ThresholdCompliance < DataAnalysis
  validates :threshold, presence: true

  def calculate_data
    data_capture.data.map{ |entry| entry > threshold ? 1 : 0 }
  end
end
