require 'rails_helper'

describe DataCapture do
  it 'has the correct validations' do
    @data_capture = DataCapture.new
    expect(@data_capture.valid?).to eq(false)

    expect(@data_capture.errors.messages).to eq({
      data: ["can't be blank"],
      title: ["can't be blank"],
    })
  end

  it 'can save if validations pass' do
    @data_capture = DataCapture.create(data: [1,2,3], title: 'Test')
    expect(@data_capture.valid?).to eq(true)
    expect(DataCapture.count).to eq(1)
  end
end
