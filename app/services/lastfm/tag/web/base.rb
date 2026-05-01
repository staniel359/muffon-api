module LastFM
  module Tag
    module Web
      class Base < LastFM::Tag::Base
        include LastFM::Mixins::Web
        include LastFM::Mixins::Web::Pagination

        private

        def request_url
          "#{super}/tag/#{tag_name}"
        end

        def tag_name
          param_formatted(
            @args[:tag_name]
          )
        end

        def request_params
          {
            **super,
            page:
          }
        end
      end
    end
  end
end
