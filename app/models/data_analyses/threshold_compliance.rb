class DataAnalyses::ThresholdCompliance < DataAnalysis
  validates :threshold, presence: true

  def data_mapping
    -> (entry) { entry > threshold ? 1 : 0 }
  end
end
