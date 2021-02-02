module Yandex
  module Music
    module Artist
      class Albums < Yandex::Music::Base
        private

        def primary_args
          [@args.artist_id]
        end

        def no_data?
          response_data['albums'].blank?
        end

        def link
          'https://music.yandex.ru/handlers/artist.jsx'
        end

        def params
          {
            artist: @args.artist_id,
            what: 'albums',
            sort: 'year'
          }
        end

        def data
          { artist: artist_data }
        end

        def artist_data
          {
            name: response_data.dig('artist', 'name'),
            albums: albums_data
          }
        end

        def albums_data
          albums_list.map { |a| album_data(a) }
        end

        def albums_list
          response_data['albums']
        end

        def album_data(album)
          {
            title: full_title(album),
            images: images_data(album, 'album'),
            released: album['year'].to_s,
            yandex_music_id: album['id']
          }
        end
      end
    end
  end
end
