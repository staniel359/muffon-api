module Genius
  module Album
    class Info < Genius::Album::Base
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
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tracks:
        }.compact
      end

      def description
        album['description_preview']
      end

      def tracks
        Genius::Album::Tracks.call(
          album_id: @args[:album_id],
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:tracks] || []
      end
    end
  end
end
