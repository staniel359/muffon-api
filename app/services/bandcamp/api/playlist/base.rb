module Bandcamp
  module API
    module Playlist
      class Base < Bandcamp::API::Base
        private

        def primary_args
          [@args.artist_id, bandcamp_playlist_id]
        end

        def link
          'https://bandcamp.com/api/mobile/22/tralbum_details'
        end

        def params
          {
            band_id: @args.artist_id,
            tralbum_id: bandcamp_playlist_id,
            tralbum_type: bandcamp_playlist_type[0]
          }
        end

        def artist_name(data)
          data['tralbum_artist'] || data['band_name']
        end

        def title
          response_data['title']
        end

        def artist_data(data)
          { name: artist_name(data) }
        end

        def length(track)
          track['duration'].floor
        end

        def description
          response_data['about'].to_s
        end

        def tags
          response_data['tags'].map { |t| t['name'] }
        end

        def tracks_list
          response_data['tracks']
        end

        def audio_link(track)
          track.dig('streaming_url', 'mp3-128')
        end
      end
    end
  end
end
