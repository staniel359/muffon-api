module Muffon
  module Utils
    module More
      private

      def with_more_data
        {
          with_more: {
            description: with_more_description?,
            tags: with_more_tags?
          }.compact
        }
      end

      def with_more_description?
        defined?(description) &&
          description.size >
            description_truncated.size
      end

      def with_more_tags?
        defined?(tags_list) &&
          tags_list.size > 5
      end
    end
  end
end
