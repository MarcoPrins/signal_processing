class DataAnalysis < ActiveRecord::Base
  belongs_to :data_capture

  serialize :data

  after_validation :set_data, if: -> { errors.size == 0 }

  enum type: {
    'DataAnalyses::ThresholdCompliance' => 'threshold_compliance',
  }

  def set_data
    self.data = calculate_data
  end

  def calculate_data
    raise 'This method should be implemented on the child class'
  end
end
