module LastFM
  module User
    class Plays < LastFM::User::Base
      API_METHOD = 'user.getRecentTracks'.freeze
      COLLECTION_NAME = 'plays'.freeze

      include Muffon::Utils::Pagination

      private

      def params
        super.merge(
          pagination_params
        )
      end

      def total_pages_count
        plays_data.dig(
          '@attr', 'totalPages'
        ).to_i
      end

      def plays_data
        response_data['recenttracks']
      end

      def collection
        plays_list_filtered.map do |p|
          play_formatted(p)
        end
      end

      def plays_list_filtered
        plays_list.reject do |p|
          playing?(p)
        end
      end

      def plays_list
        plays_data['track']
      end

      def playing?(play)
        play.dig(
          '@attr', 'nowplaying'
        ) == 'true'
      end

      def play_formatted(play)
        LastFM::User::Plays::Play.call(
          play:
        )
      end

      alias user_data paginated_data
    end
  end
end
