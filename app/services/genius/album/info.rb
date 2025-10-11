module Genius
  module Album
    class Info < Genius::Album::Base
      private

      def album_data
        return album_list_data if @args[:list]

        album_full_data
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_base_data
        @album_base_data ||= {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }.compact
      end

      def album_list_extra_data
        {
          release_date:,
          listeners_count:
        }.compact
      end

      def album_extra_data
        {
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tracks:
        }.compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        album['description_preview'].presence
      end

      def tracks
        Genius::Album::Tracks.call(
          album_id: @args[:album_id],
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )[:tracks] || []
      end
    end
  end
end
