module Spotify
  module User
    class Tracks < Spotify::User::Base
      private

      def user_data
        paginated_data(
          collection_name: 'tracks',
          raw_collection:,
          page:,
          limit:,
          items_count:,
          is_with_items_count: true
        )
      end

      def raw_collection
        raw_user_data['items']
      end

      def request_url
        "#{super}/tracks"
      end

      def request_params
        {
          **super,
          limit:,
          offset:
        }
      end

      def items_count
        raw_user_data['total']
      end

      def collection_item_data_formatted(
        raw_track_data
      )
        Spotify::User::Tracks::Track.call(
          raw_track_data:,
          **self_args
        )
      end
    end
  end
end
