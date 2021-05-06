module Deezer
  module Utils
    module Tokens
      class Track < Base
        private

        def data
          { track_token: track_token }
        end

        def track_token
          return '' if @args.track_id.blank?

          response_data.dig('results', 'data', 0, 'TRACK_TOKEN')
        end

        def payload
          { sng_ids: [@args.track_id] }.to_json
        end

        def request_method
          'song.getListData'
        end

        def request_api_token
          user_tokens[:api_token]
        end
      end
    end
  end
end
