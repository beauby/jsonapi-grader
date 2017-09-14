RSpec.describe 'include' do
  it 'fetches a single resource with includes' do
    get '/books/1?include=author'

    expect(response_status).to be 200
    expect(response_body['data']).to have_type('books')
    expect(response_body['data']).to have_id('1')
    expect(response_body['data'])
      .to have_relationship('author').with_data('id' => '1', 'type' => 'authors')
    expect(response_body['data']).to have_relationship('series')
    author = response_body['data']['relationships']['author']['data']
    expect(response_body['included'])
      .to include(have_type('authors').and have_id(author['id']))
  end

  it 'fetches a single resource with includes and stripped out relationship field' do
    get '/books/1?include=author&fields[books]=title'

    expect(response_status).to be 200
    expect(response_body['data']).to have_type('books')
    expect(response_body['data']).to have_id('1')
    expect(response_body['data']).not_to have_relationship('author')
    expect(response_body['data']).not_to have_relationship('series')
    expect(response_body['included'])
      .to include(have_type('authors'))
  end

  it 'includes series relationship by default' do
    get '/books/1'

    expect(response_status).to be 200
    expect(response_body['data']).to have_type('books')
    expect(response_body['data']).to have_id('1')
    expect(response_body['data']).to have_relationship('series')
    expect(response_body['included']).to include(have_type('series'))
  end
end
