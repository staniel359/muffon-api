module Discogs
  module Album
    class Info < Discogs::Album::Base
      private

      def album_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
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

      def album_extra_data
        {
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          labels:,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def raw_release_date
        album['released']
      end

      def labels_list
        album['labels']
      end
    end
  end
end
