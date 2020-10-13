module VK
  module Search
    class Base < VK::Web
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        super || playlists.blank?
      end

      def request_params
        {
          act: 'section',
          section: 'search',
          al: 1,
          q: @args.query,
          owner_id: secrets.vk[:page_id]
        }
      end

      def playlists
        @playlists ||= response_data.dig(1, 1, 'playlists')
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
