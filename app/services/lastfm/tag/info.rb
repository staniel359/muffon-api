module LastFM
  module Tag
    class Info < LastFM::Tag::Base
      API_METHOD = 'tag.getInfo'.freeze

      include LastFM::Mixins::Tag

      private

      def not_found?
        taggings_count.zero?
      end

      def raw_tag_data
        response_data['tag']
      end

      def request_params
        {
          **super,
          lang: language
        }.compact
      end

      def tag_data
        Muffon::Formatter::Source::Tag::Info.call(
          name:,
          taggings_count:,
          taggers_count:,
          description:
        )
      end
    end
  end
end
