module LastFM
  module Tag
    module Web
      class Base < LastFM::Tag::Base
        include LastFM::Mixins::Web
        include LastFM::Mixins::Web::Pagination

        private

        def link
          "https://www.last.fm/tag/#{tag_name}"
        end

        def tag_name
          param_formatted(
            @args[:tag_name]
          )
        end

        def params
          {
            **super,
            page:
          }
        end
      end
    end
  end
end
