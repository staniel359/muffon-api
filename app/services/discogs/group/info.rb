module Discogs
  module Group
    class Info < Discogs::Group::Base
      private

      def group_data
        self_data
          .merge(group_base_data)
          .merge(group_extra_data)
          .merge(with_more_data)
      end

      def group_base_data
        {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }.compact
      end

      def group_extra_data
        {
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def tags_truncated
        collection_truncated(
          tags,
          size: 'extrasmall'
        )
      end

      def album_base_data
        @album_base_data ||= group_base_data
      end
    end
  end
end
