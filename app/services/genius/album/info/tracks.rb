module Genius
  module Album
    class Info
      class Tracks < Genius::Album::Info
        private

        def no_data?
          tracks_list.blank?
        end

        def tracks_list
          @tracks_list ||= response_data.dig(
            'response', 'tracks'
          )
        end

        def link
          "#{super}/tracks"
        end

        def data
          { tracks: tracks_data }
        end

        def tracks_data
          tracks_list.map { |t| track_data(t['song']) }
        end

        def track_data(track)
          {
            title: track['title_with_featured'],
            genius_id: track['id'],
            artist: artist_data(track)
          }
        end

        def artist_data(track)
          {
            name: track.dig('primary_artist', 'name'),
            genius_id: track.dig('primary_artist', 'id')
          }
        end
      end
    end
  end
end
