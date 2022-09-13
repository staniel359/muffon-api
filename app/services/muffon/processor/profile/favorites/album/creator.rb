module Muffon
  module Processor
    module Profile
      module Favorites
        module Album
          class Creator < Muffon::Processor::Profile::Favorites::Base
            include Muffon::Utils::Album

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist_name]
              ]
            end

            def process_favorite
              favorite_album

              return favorite_album.errors_data if
                  favorite_album.errors?

              process_image

              { favorite_album: favorite_album_data }
            end

            def favorite_album
              @favorite_album ||=
                profile
                .favorite_albums
                .where(
                  album_id: find_album.id
                ).first_or_create
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist_name]
            end

            def process_image
              favorite_album.process_image(
                @args[:image_url]
              )
            end

            def favorite_album_data
              { id: favorite_album.id }
            end
          end
        end
      end
    end
  end
end
