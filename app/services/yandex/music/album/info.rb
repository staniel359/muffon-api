module Yandex
  module Music
    module Album
      class Info < Yandex::Music::Album::Base
        private

        def album_data
          album_base_data.merge(album_extra_data)
        end

        def album_base_data
          {
            title: response_data['title'],
            artist: artist_data,
            source: 'yandex'
          }
        end

        def album_extra_data
          {
            images: images_data(response_data, 'album'),
            released: response_data['year'].to_s,
            labels: labels,
            tags: tags.first(5),
            tracks: tracks_data
          }
        end

        def labels
          labels_list.map { |l| l['name'] }
        end

        def labels_list
          response_data['labels']
        end

        def tracks_data
          tracks_list.map { |t| track_data(t) }
        end

        def tracks_list
          response_data['volumes'].flatten
        end

        def track_data(track)
          {
            id: track_id(artist_name(track), track['title']),
            title: track['title'],
            artist: track_artist_data(track),
            length: length(track),
            audio: audio_data(track)
          }
        end

        def track_artist_data(track)
          { name: artist_name(track) }
        end

        def audio_data(track)
          {
            present: track['id'].present?,
            id: track['id'].to_i,
            source: 'yandex'
          }
        end
      end
    end
  end
end
