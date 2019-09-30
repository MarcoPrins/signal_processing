class DataAnalysis < ActiveRecord::Base
  belongs_to :data_capture

  serialize :data

  after_validation :set_data, if: -> { errors.size == 0 }

  validates :data_capture_id, presence: true

  enum type: {
    'DataAnalyses::ThresholdCompliance' => 'threshold_compliance',
  }

  def set_data
    self.data = calculate_data
  end

  def calculate_data
    data_capture.data.map{ |entry| data_mapping[entry] }
  end

  def data_mapping
    raise 'This method should be implemented on the child class'
  end
end
