module LastFM
  module Tag
    class Info < LastFM::Tag::Base
      private

      def params
        super.merge(
          language_params
        )
      end

      def tag_data
        tag_base_data
          .merge(with_more_data)
      end

      def tag_base_data
        {
          name:,
          taggings_count:,
          taggers_count:,
          description: description_truncated
        }
      end

      def name
        tag['name']
      end

      def taggings_count
        tag['total']
      end

      def taggers_count
        tag['reach']
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        tag.dig(
          'wiki', 'content'
        )
      end
    end
  end
end
