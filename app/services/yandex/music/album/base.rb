module Yandex
  module Music
    module Album
      class Base < Yandex::Music::Base
        private

        def primary_args
          [@args.album_id]
        end

        def no_data?
          response_data['id'].blank?
        end

        def link
          'https://music.yandex.ru/handlers/album.jsx'
        end

        def params
          { album: @args.album_id }
        end

        def data
          { album: album_data }
        end

        def tags
          [response_data['genre']]
        end
      end
    end
  end
end
