module Bandcamp
  module API
    module Album
      class Base < Bandcamp::API::Base
        private

        def primary_args
          [@args.artist, bandcamp_album_title]
        end

        def id_link
          "#{artist_id_link}/#{bandcamp_album_type}/#{bandcamp_album_title}"
        end

        def link
          'https://bandcamp.com/api/mobile/22/tralbum_details'
        end

        def params
          {
            band_id: id_data[:artist_id],
            tralbum_id: id_data[:id],
            tralbum_type: bandcamp_album_type[0]
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

        def audio_data(track)
          {
            present: audio_link(track).present?,
            link: audio_link(track),
            source: 'bandcamp'
          }
        end

        def audio_link(track)
          track.dig('streaming_url', 'mp3-128')
        end
      end
    end
  end
end
