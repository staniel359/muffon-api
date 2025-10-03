module Muffon
  module Utils
    module More
      private

      def with_more_data
        {
          with_more: {
            description: with_more_description?,
            tags: with_more_tags?
          }.compact_blank
        }.compact_blank
      end

      def with_more_description?
        description.present? && (
          description.size >
            description_truncated.size
        )
      end

      def description
        nil
      end

      def with_more_tags?
        raw_tags.size > 5
      end

      def raw_tags
        []
      end
    end
  end
end
