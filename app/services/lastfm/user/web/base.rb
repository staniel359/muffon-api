module LastFM
  module User
    module Web
      class Base < LastFM::User::Base
        include LastFM::Utils::Web::Proxy

        private

        def base_link
          "https://www.last.fm/user/#{lastfm_nickname}"
        end

        def data
          { user: user_data }
        end

        def user_base_data
          { nickname: }
        end

        def nickname
          response_data.css(
            '.header-title'
          ).text.strip
        end
      end
    end
  end
end
