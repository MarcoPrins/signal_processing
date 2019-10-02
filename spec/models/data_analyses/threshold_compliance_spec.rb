require 'rails_helper'

describe DataAnalyses::ThresholdCompliance do
  before do
    @data_capture = DataCapture.create(title: 'Test Threshold Compliance', data: [1,2,0,5,4,2,5])
  end

  it 'returns 1 for each entry where the signal exceeds the threshold; and 0 for other entries' do
    data_analysis = DataAnalyses::ThresholdCompliance.new(data_capture_id: @data_capture.id, threshold: 4)
    expect(data_analysis.calculate_data).to eq([0, 0, 0, 1, 0, 0, 1])

    data_analysis = DataAnalyses::ThresholdCompliance.new(data_capture_id: @data_capture.id, threshold: 2)
    expect(data_analysis.calculate_data).to eq([0, 0, 0, 1, 1, 0, 1])
  end

  it 'validates presence of threshold' do
    data_analysis = DataAnalyses::ThresholdCompliance.new(data_capture_id: @data_capture.id)
    expect(data_analysis.valid?).to eq(false)
    expect(data_analysis.errors.messages).to eq({
      threshold: ["can't be blank"],
    })
  end

  it 'can save if validations pass' do
    data_analysis = DataAnalyses::ThresholdCompliance.create(data_capture_id: @data_capture.id, threshold: 1)
    expect(data_analysis.valid?).to eq(true)
    expect(DataAnalyses::ThresholdCompliance.count).to eq(1)
  end
end
