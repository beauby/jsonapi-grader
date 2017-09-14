RSpec.describe 'content negotiation' do
  it 'responds with correct content type' do
    get '/books/1'

    expect(response_status).to be 200
    expect(response['Content-Type']).to eq('application/vnd.api+json')
  end

  context 'when requesting with media type parameters in content type' do
    it 'responds with 415' do
      get '/books/1', 'Content-Type' => 'application/vnd.api+json; foo=bar'

      expect(response_status).to be 415
    end
  end

  context 'when requesting with media type parameters in accept' do
    it 'responds with 412' do
      get '/books/1', 'Accept' => 'application/vnd.api+json; foo=bar'

      expect(response_status).to be 412
    end
  end
end
