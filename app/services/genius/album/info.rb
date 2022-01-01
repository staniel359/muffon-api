module Genius
  module Album
    class Info < Genius::Album::Base
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
          artists: artists
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          description: description_truncated,
          tracks:
        }.compact
      end

      def description
        album['description_preview']
      end

      def tracks
        tracks_data[:tracks] || []
      end

      def tracks_data
        Genius::Album::Tracks.call(
          album_id: @args[:album_id],
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
