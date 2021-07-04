module Deezer
  module Search
    class Tracks
      class Track < Deezer::Search::Tracks
        include Deezer::Utils::Track

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
            extra_title: extra_title,
            deezer_id: deezer_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def extra_data
          {
            album: album_formatted,
            albums: albums,
            image: image_data,
            duration: duration,
            audio: audio_data
          }
        end
      end
    end
  end
end
