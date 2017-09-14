RSpec.describe 'links' do
  it 'has top level links in the response' do
    get '/books/1'

    expect(response_body).to have_link('root')
  end
end
