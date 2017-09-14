RSpec.describe 'meta' do
  it 'has a top level meta in the response' do
    get '/books/1'

    expect(response_body).to have_meta('foo' => 'bar')
  end
end
