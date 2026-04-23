module LastFM
  module Tag
    class Similar < LastFM::Tag::Web::Base
      include LastFM::Mixins::Tag

      private

      def tag_data
        { similar: tags }
      end

      def raw_tags
        response_data.css(
          '.tags-list .tag'
        )
      end
    end
  end
end
