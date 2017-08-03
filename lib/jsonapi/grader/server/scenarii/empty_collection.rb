require 'net/http'
require 'jsonapi/grader/server/scenario'

module JSONAPI
  module Grader
    module Server
      class EmptyCollectionScenario < Scenario
        def name
          'empty_collection'
        end

        def description
          'The endpoint /empty_collection should return an empty collection.'
        end

        def score
          100
        end

        def required
          true
        end

        def call(host)
          uri = URI("#{host}/empty_collection")
          res = Net::HTTP.start(uri.hostname, uri.port) do |http|
            req = Net::HTTP::Get.new(uri)
            req['Accept'] = 'application/vnd.api+json'

            http.request(req)
          end

          unless res['Content-Type'] == 'application/vnd.api+json'
            fail 'Expected Content-Type header to equal application/vnd.api+json'
          end

          body = JSON.parse(res.body)
          unless body['data'] == []
            fail 'Expected empty collection'
          end
        end
      end
    end
  end
end
