module Deezer
  module Album
    class Info < Deezer::Album::Base
      private

      def album_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source: source_data,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          listeners_count: album['NB_FAN'],
          profiles_count:,
          release_date:,
          labels:,
          tracks:
        }.compact
      end

      def labels
        album['LABEL_NAME']
          .split('/')
          .uniq
      end

      def tracks_list
        response_data.dig(
          'results', 'SONGS', 'data'
        )
      end

      def track_data_formatted(track)
        Deezer::Album::Info::Track.call(
          track: track['FALLBACK'] || track,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
