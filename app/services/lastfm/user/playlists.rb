module LastFM
  module User
    class Playlists < LastFM::User::Web::Base
      private

      def user_data
        {
          **user_base_data,
          **playlists_data
        }
      end

      def playlists_data
        paginated_data(
          collection_name: 'playlists',
          raw_collection:,
          page:,
          limit:,
          is_with_items_count: true,
          items_count:,
          pages_count:
        )
      end

      def raw_collection
        response_data.css(
          '.playlisting-playlists-item'
        )
      end

      def request_url
        "#{super}/playlists"
      end

      def request_params
        {
          **super,
          page:
        }
      end

      def items_count
        LastFM::User::Playlists::TotalCount.call(
          nickname: lastfm_nickname,
          pages_count:
        )
      end

      def pages_count
        if raw_pages_count.present?
          raw_pages_count
            .text
            .strip
            .to_i
        else
          1
        end
      end

      def raw_pages_count
        response_data
          .css('.pagination-page')
          .last
      end

      def collection_item_data_formatted(
        raw_playlist_data
      )
        LastFM::User::Playlists::Playlist.call(
          raw_playlist_data:,
          nickname: lastfm_nickname,
          skip_profile: true
        )
      end
    end
  end
end
