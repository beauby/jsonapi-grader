require 'net/http'
require 'json'

module HTTPHelpers
  def request(klass, url, headers)
    uri = URI(ENV['HOST'] + url)
    req = klass.new(uri)
    req['Accept'] = 'application/vnd.api+json'

    yield(req) if block_given?

    headers.each { |k, v| req[k.to_s] = v }

    @_response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end

  def get(url, headers = {})
    request(Net::HTTP::Get, url, headers)
  end

  def post(url, payload, headers = {})
    request(Net::HTTP::Post, url, headers) do |req|
      req['Content-Type'] = 'application/vnd.api+json'
      req.body = payload.to_json
    end
  end

  def patch(url, payload, headers = {})
    request(Net::HTTP::Patch, url, headers) do |req|
      req['Content-Type'] = 'application/vnd.api+json'
      req.body = payload.to_json
    end
  end

  def delete(url, headers = {})
    request(Net::HTTP::Delete, url, headers)
  end

  def response
    @_response
  end

  def response_body
    JSON.parse(response.body)
  end

  def response_status
    response.code.to_i
  end
end
