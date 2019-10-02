require 'rails_helper'

describe DataAnalysis do
  before do
    @data_capture = DataCapture.create(title: 'Test capture', data: [1,2,3])
  end

  it 'has the correct validations' do
    @data_analysis = DataAnalysis.new
    expect(@data_analysis.valid?).to eq(false)

    expect(@data_analysis.errors.messages).to eq({
      data_capture: ["must exist"],
    })
  end

  it 'does not try to set data if validations fail' do
    @data_analysis = DataAnalysis.new
    expect(@data_analysis.valid?).to eq(false)
    expect(@data_analysis.data).to eq(nil)
  end

  it 'sets data if validations pass' do
    @data_analysis = DataAnalysis.new(data_capture_id: @data_capture.id)

    expect(@data_analysis).to receive(:calculate_data).and_return([4,5,6])
    expect(@data_analysis.valid?).to eq(true)
    expect(@data_analysis.data).to eq([4,5,6])
  end

  it 'has a data calculation implemented for each subclass' do
    DataAnalysis.types.each do |type, _|
      instance = type.constantize.new(data_capture_id: @data_capture.id)
      expect { instance.calculate_data }.not_to raise_error 'This method should be implemented on the child class'
    end
  end
end
