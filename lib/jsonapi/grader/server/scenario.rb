module JSONAPI
  module Grader
    module Server
      class Scenario
        def call(host)
          raise 'Not implemented'
        end

        def score
          raise 'Not implemented'
        end

        def name
          raise 'Not implemented'
        end

        def description
          raise 'Not implemented'
        end

        def endpoint
          raise 'Not implemented'
        end

        def required
          raise 'Not implemented'
        end
      end
    end
  end
end
