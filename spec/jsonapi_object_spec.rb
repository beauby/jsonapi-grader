RSpec.describe 'jsonapi object' do
  it 'has a top level jsonapi object in the response' do
    get '/books/1'

    expect(response_body).to have_jsonapi_object('version' => '1.0')
  end
end
