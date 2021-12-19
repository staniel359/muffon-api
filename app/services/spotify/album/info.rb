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
          source_id: SOURCE_ID,
          title: title,
          artist: artist_formatted,
          artists: artists
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          labels: labels,
          tracks: tracks
        }.compact
      end

      def labels
        [album['label']]
      end

      def tracks
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        album.dig(
          'tracks', 'items'
        )
      end

      def track_data_formatted(track)
        Spotify::Album::Info::Track.call(
          track: track,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
