module LastFM
  module User
    class Plays < LastFM::User::Base
      API_METHOD = 'user.getRecentTracks'.freeze

      private

      def user_data
        paginated_data(
          collection_name: 'plays',
          raw_collection:
            raw_collection_filtered,
          page:,
          limit:,
          pages_count:
        )
      end

      def raw_collection_filtered
        raw_collection.reject do |raw_play_data|
          playing?(
            raw_play_data
          )
        end
      end

      def raw_collection
        response_data.dig(
          'recenttracks',
          'track'
        )
      end

      def params
        {
          **super,
          page:,
          limit:
        }
      end

      def playing?(
        raw_play_data
      )
        raw_play_data
          .dig(
            '@attr',
            'nowplaying'
          ) == 'true'
      end

      def pages_count
        response_data
          .dig(
            'recenttracks',
            '@attr',
            'totalPages'
          )
          .to_i
      end

      def collection_item_data_formatted(play)
        LastFM::User::Plays::Play.call(
          play:
        )
      end
    end
  end
end
