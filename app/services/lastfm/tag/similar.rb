module LastFM
  module Tag
    class Similar < LastFM::Web::Base
      private

      def primary_args
        [@args[:tag]]
      end

      def link
        "https://www.last.fm/tag/#{tag_name}"
      end

      def tag_name
        param_formatted(
          @args[:tag]
        )
      end

      def data
        { tag: tag_data }
      end

      def tag_data
        { similar: tags }
      end

      def tags_list
        response_data.css(
          '.tags-list .tag'
        )
      end
    end
  end
end
