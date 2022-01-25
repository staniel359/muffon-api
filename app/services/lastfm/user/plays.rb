module LastFM
  module User
    class Plays < LastFM::User::Base
      API_METHOD = 'user.getRecentTracks'.freeze
      COLLECTION_NAME = 'plays'.freeze
      include LastFM::Utils::Pagination

      private

      def pagination_params
        {
          page:,
          limit: 500
        }
      end

      def user_data
        user_base_data
          .merge(paginated_data)
      end

      def user_base_data
        {
          nickname:,
          plays_count:
        }
      end

      def nickname
        plays_extra_data['user']
      end

      def plays_extra_data
        @plays_extra_data ||=
          plays_data['@attr']
      end

      def plays_data
        @plays_data ||=
          response_data['recenttracks']
      end

      def total_pages_count
        plays_extra_data['totalPages'].to_i
      end

      def plays_count
        plays_extra_data['total'].to_i
      end

      def collection
        plays_list.map do |p|
          play_formatted(p)
        end
      end

      def plays_list
        plays_data['track']
      end

      def play_formatted(play)
        LastFM::User::Plays::Play.call(
          play:
        )
      end
    end
  end
end
