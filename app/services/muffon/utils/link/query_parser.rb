module Muffon
  module Utils
    module Link
      class QueryParser < Muffon::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:link]]
        end

        def data
          Rack::Utils.parse_nested_query(
            raw_query
          )
        end

        def raw_query
          URI.parse(link).query
        end

        def link
          @args[:link]
        end
      end
    end
  end
end
