RSpec.describe 'Fetching a single resource' do
  it 'fetches a single resource' do
    get '/books/1'

    expect(response_status).to be 200
    expect(response_body['data']).to have_type('books')
    expect(response_body['data']).to have_id('1')
    expect(response_body['data']).to have_attribute('title')
      .with_value('The Fellowship of the Ring')
    expect(response_body['data']).to have_relationship('author')
    expect(response_body['data']).to have_relationship('series')
  end

  it 'fetches a single resource with meta' do
    get '/books/1'

    expect(response_status).to be 200
    expect(response_body['data']).to have_meta('foo' => 'bar')
  end

  it 'fetches a single resource with links' do
    get '/books/1'

    expect(response_status).to be 200
    expect(response_body['data']).to have_link('self')
  end

  it 'fetches a non-existent resource' do
    get '/books/foo'

    expect(response_status).to be 404
  end
end
