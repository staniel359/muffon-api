module Bandcamp
  module Utils
    module Web
      class Info < Bandcamp::Base
        def call
          check_args

          data
        rescue Faraday::ResourceNotFound
          nil
        end

        private

        def required_args
          %i[
            url
          ]
        end

        def data
          JSON.parse(
            raw_data
          )
        end

        def raw_data
          script['data-embed']
        end

        def script
          scripts.xpath(
            "//*[contains(@src, 'tralbum_head')]"
          )[0]
        end

        def scripts
          response_data.css(
            'script'
          )
        end

        def response_data
          Muffon::Request.call(
            url: @args[:url],
            method: 'GET',
            response_type: 'html'
          )
        end
      end
    end
  end
end
