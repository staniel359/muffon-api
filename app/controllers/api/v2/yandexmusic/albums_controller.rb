module API
  module V2
    module YandexMusic
      class AlbumsController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        private

        def info_data
          ::YandexMusic::Album::Info.call(
            params.slice(
              *%i[album_id profile_id language]
            )
          )
        end

        def tags_data
          ::YandexMusic::Album::Tags.call(
            params.slice(:album_id)
          )
        end
      end
    end
  end
end
