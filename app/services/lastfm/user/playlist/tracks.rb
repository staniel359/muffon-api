module LastFM
  module User
    module Playlist
      class Tracks < LastFM::User::Web::Base
        PAGE_LIMIT = 50

        private

        def required_args
          [
            *super,
            :playlist_id
          ]
        end

        def user_data
          { playlist: playlist_data }
        end

        def request_url
          "#{super}/playlists/#{@args[:playlist_id]}"
        end

        def playlist_data
          {
            title:,
            **tracks_data
          }
        end

        def title
          response_data
            .css('.playlisting-playlist-header-title')[0]
            .text
        end

        def request_params
          {
            **super,
            page:
          }
        end

        def tracks_data
          paginated_data(
            collection_name: 'tracks',
            raw_collection:,
            page:,
            limit: PAGE_LIMIT,
            items_count:,
            is_with_items_count: true
          )
        end

        def items_count
          response_data
            .css('.playlisting-playlist-length')[0]
            .text
            .strip
            .scan(/\d+/)
            .join
            .to_i
        end

        def raw_collection
          response_data.css(
            '.chartlist-row'
          )
        end

        def collection_item_data_formatted(
          raw_track_data
        )
          LastFM::User::Playlist::Tracks::Track.call(
            raw_track_data:
          )
        end
      end
    end
  end
end
