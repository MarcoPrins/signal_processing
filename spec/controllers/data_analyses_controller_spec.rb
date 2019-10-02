require 'rails_helper'

describe DataAnalysesController, type: :controller do
  before do
    @data_capture = DataCapture.create(title: 'Test controller', data: [1, 2, 3, 4, 5, 6, 7])
  end

  describe 'GET preview' do
    it 'returns validation error if you do not pass the correct parameters' do
      get :preview, params: { type: 'delta' }
      expect(JSON.parse response.body).to eq({'errors' => {'data_capture' => ['must exist']}})
    end

    it 'shows an example of the analysed data' do
      get :preview, params: { type: 'delta', data_capture_id: @data_capture.id }
      expect(DataAnalysis.count).to eq(0) # Also make sure it didn't save

      expect(JSON.parse response.body).to eq({'data' => [nil, 1, 1, 1, 1, 1, 1]})
    end
  end

  describe 'POST create' do
    it 'returns validation error if you do not pass the correct parameters' do
      post :create, params: { type: 'delta' }
      expect(DataAnalysis.count).to eq(0)

      expect(JSON.parse response.body).to eq({'errors' => {'data_capture' => ['must exist']}})
    end

    it 'saves the the analysed data' do
      post :create, params: { type: 'delta', data_capture_id: @data_capture.id }
      expect(DataAnalyses::Delta.count).to eq(1)
      expect(DataAnalyses::Delta.first.data).to eq([nil, 1, 1, 1, 1, 1, 1])

      expect(JSON.parse response.body).to eq({'data' => [nil, 1, 1, 1, 1, 1, 1]})
    end
  end
end
