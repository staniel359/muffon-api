module LastFM
  module Mixins
    module Tag
      include Muffon::Mixins::Formatting::Collection

      private

      def name
        raw_tag_data['name']
      end

      def taggings_count
        raw_tag_data['total']
      end

      def taggers_count
        raw_tag_data['reach']
      end

      def description
        LastFM::Formatter::Description.call(
          description: raw_description
        )
      end

      def raw_description
        raw_tag_data.dig(
          'wiki',
          'content'
        )
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data.text
      end
    end
  end
end
