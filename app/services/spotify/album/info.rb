module Spotify
  module Album
    class Info < Spotify::Album::Base
      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source_id:,
          title:,
          artist: artist_names_data,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          labels:,
          tracks:
        }.compact
      end

      def labels
        [album['label']]
      end

      def tracks_list
        album.dig(
          'tracks', 'items'
        )
      end

      def track_data_formatted(track)
        Spotify::Album::Info::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
