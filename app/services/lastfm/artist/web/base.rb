module LastFM
  module Artist
    module Web
      class Base < LastFM::Artist::Base
        include LastFM::Mixins::Artist
        include LastFM::Mixins::Web

        private

        def not_found?
          name.blank?
        end

        def name
          response_data
            .css(
              '.header-new-title'
            )[0]
            &.text
        end

        def request_url
          "#{super}/music/#{artist_name_formatted}"
        end

        def artist_name_formatted
          param_formatted(
            @args[:artist_name]
          )
        end

        def artist_base_data
          { name: }
        end
      end
    end
  end
end
