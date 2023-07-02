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
          artists:
        }
      end

      def group_extra_data
        {
          image: image_data,
          profiles_count:,
          release_date:,
          description:
            description_truncated,
          tags: tags_truncated,
          tracks:
        }.compact
      end
    end
  end
end
