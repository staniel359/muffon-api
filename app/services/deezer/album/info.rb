module Deezer
  module Album
    class Info < Deezer::Album::Base
      private

      def album_data
        album_base_data
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          title: title,
          deezer_id: deezer_id,
          artist: artist_formatted,
          artists: artists,
          source_id: SOURCE_ID
        }
      end

      def album_extra_data
        {
          image: image_data,
          listeners_count: listeners_count,
          release_date: release_date,
          labels: labels,
          tracks: tracks
        }
      end

      def listeners_count
        album['NB_FAN']
      end

      def labels
        album['LABEL_NAME'].split('/')
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        response_data.dig(
          'results', 'SONGS', 'data'
        )
      end

      def track_data_formatted(track)
        Deezer::Album::Info::Track.call(
          track: track['FALLBACK'] || track
        )
      end
    end
  end
end
