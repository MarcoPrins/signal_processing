require 'rails_helper'

describe DataCapturesController, type: :controller do
  before do
    @data_capture = DataCapture.create(title: 'Test controller', data: [1, 2, 3])
  end

  describe 'GET show' do
    it 'shows the appropriate data capture' do
      get :show, params: { id: @data_capture.id }
      data = JSON.parse(response.body)['data']

      expect(data['id']).to eq(@data_capture.id)
      expect(data['data']).to eq([1, 2, 3])
      expect(data['title']).to eq('Test controller')
    end
  end
end
