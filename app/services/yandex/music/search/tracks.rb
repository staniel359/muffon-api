module Yandex
  module Music
    module Search
      class Tracks < Yandex::Music::Search::Base
        private

        def collection_name
          'tracks'
        end

        def collection_item_data(track)
          {
            title: full_title(track),
            artist: artist_data(track),
            album: album_data(track),
            images: images_data(track, 'track'),
            length: length(track),
            yandex_music_id: track['id']
          }
        end

        def artist_data(track)
          { name: artist_name(track) }
        end

        def album_data(track)
          { title: track.dig('albums', 0, 'title') }
        end
      end
    end
  end
end
