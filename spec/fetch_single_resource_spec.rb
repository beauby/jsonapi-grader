RSpec.describe 'foo' do
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
end
