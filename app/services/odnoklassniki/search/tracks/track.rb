module Odnoklassniki
  module Search
    class Tracks
      class Track < Odnoklassniki::Search::Tracks
        include Odnoklassniki::Utils::Track

        def call
          data
        end

        private

        def data
          base_data.merge(extra_data)
        end

        def base_data
          {
            title: title,
            odnoklassniki_id: odnoklassniki_id,
            artist: artist_formatted,
            artists: artists
          }
        end

        def track
          @track ||= @args.track
        end

        def artists
          [artist_data_formatted]
        end

        def artist_data_formatted
          {
            name: track['ensemble'],
            odnoklassniki_id: track['masterArtistId']
          }
        end

        def extra_data
          {
            albums: albums,
            image: image_data,
            duration: duration,
            audio: audio_data
          }
        end

        def albums
          [album_data_formatted]
        end

        def image
          track['imageUrl']
        end

        def album_data_formatted
          { id: track['albumId'] }
        end
      end
    end
  end
end
