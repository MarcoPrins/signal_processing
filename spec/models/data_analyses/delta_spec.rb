require 'rails_helper'

describe DataAnalyses::ThresholdCompliance do
  before do
    @data_capture = DataCapture.create(title: 'Test Delta', data: [1,2,3,8,2,-14,109,22])
  end

  it 'returns the delta for each entry, with the first entry being nil' do
    data_analysis = DataAnalyses::Delta.new(data_capture_id: @data_capture.id)
    expect(data_analysis.calculate_data).to eq([nil, 1, 1, 5, -6, -16, 123, -87])
  end

  it 'can save if validations pass' do
    data_analysis = DataAnalyses::Delta.create(data_capture_id: @data_capture.id)
    expect(data_analysis.valid?).to eq(true)
    expect(DataAnalyses::Delta.count).to eq(1)
  end
end
