module LastFM
  module Tag
    class Info < LastFM::Tag::Base
      API_METHOD = 'tag.getInfo'.freeze

      private

      def not_found?
        tag.blank? ||
          tag['total'].zero?
      end

      def tag
        response_data['tag']
      end

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
          name: tag['name'],
          taggings_count: tag['total'],
          taggers_count: tag['reach'],
          description:
            description_truncated
        }
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
      end

      def description
        description_formatted(
          raw_description
        )
      end

      def raw_description
        tag.dig(
          'wiki',
          'content'
        )
      end
    end
  end
end
