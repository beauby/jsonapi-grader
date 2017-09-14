RSpec.describe 'relationships' do
  it 'has a relationship meta' do
    get '/books/1'

    expect(response_status).to be 200

    expect(response_body['data']).to have_relationship('author')
    expect(response_body['data']['relationships']['author'])
      .to have_meta('foo' => 'bar')
  end

  it 'has relationship links' do
    get '/books/1'

    expect(response_status).to be 200

    expect(response_body['data']).to have_relationship('author')
    expect(response_body['data']['relationships']['author'])
      .to have_links(:related)
  end

  it 'does not have linkage data when relationship not included' do
    get '/books/1'

    expect(response_status).to be 200

    expect(response_body['data']).to have_relationship('author')
    expect(response_body['data']['relationships']['author']['data']).to be_nil
  end
end
