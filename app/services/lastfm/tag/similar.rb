module LastFM
  module Tag
    class Similar < LastFM::Tag::Web::Base
      private

      def tag_data
        { similar: tags }
      end

      def raw_tags
        response_data.css(
          '.tags-list .tag'
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
