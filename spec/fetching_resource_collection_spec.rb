RSpec.describe 'Fetching a resource collection' do
  it 'fetches a resource collection' do
    get '/books'

    expect(response_status).to be 200
    expect(response_body['data']).to all(have_type('books'))
  end

  it 'fetches a single resource with includes' do
    get '/books/1?include=author'

    expect(response_status).to be 200
    expect(response_body['data']).to have_type('books')
    expect(response_body['data']).to have_id('1')
    expect(response_body['data']).to have_relationship('author')
      .with_data('id' => '1', 'type' => 'authors')
    expect(response_body['data']).to have_relationship('series')
    author = response_body['data']['relationships']['author']['data']
    expect(response_body['included'])
      .to include(have_type('authors').and have_id(author['id']))
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
