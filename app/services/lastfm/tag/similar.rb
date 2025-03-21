module LastFM
  module Tag
    class Similar < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'similar'.freeze

      private

      def tag_data
        { similar: tags }
      end

      def similar_list
        response_data.css(
          '.tags-list .tag'
        )
      end

      alias link base_link
      alias tags_list similar_list
    end
  end
end
