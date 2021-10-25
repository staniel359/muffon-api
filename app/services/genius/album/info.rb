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
          id: id,
          title: title,
          artist: artist_formatted,
          artists: artists
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          description: description_truncated,
          tracks: tracks
        }
      end

      def description
        album['description_preview']
      end

      def tracks
        Genius::Album::Info::Tracks.call(
          album_id: @args.album_id,
          profile_id: @args.profile_id
        )[:tracks] || []
      end
    end
  end
end
