module VK
  module Search
    class Base < VK::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        parsed_response['playlists'].blank?
      end

      def parsed_response
        @parsed_response ||= JSON.parse(
          response_to_json
        ).dig('payload', 1, 1)
      end

      def request_params
        {
          act: 'section',
          section: 'search',
          al: 1,
          q: @args.query,
          owner_id: PAGE_ID
        }
      end

      def data
        { search: search_data }
      end

      def audio_id(track)
        hashes_array = track[13].split('/')
        "#{track[1]}_#{track[0]}_"\
          "#{hashes_array[2]}_#{hashes_array[5]}"
      end
    end
  end
end
