module Muffon
  module Profile
    module Favorites
      class Albums
        class Album
          class Creator < Muffon::Profile::Base
            include Muffon::Utils::Album

            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token],
                @args[:title],
                @args[:artist_name]
              ]
            end

            def data
              return forbidden if wrong_profile?

              process_favorite_album

              return errors_data if errors?

              { favorite_id: favorite_album.id }
            end

            def process_favorite_album
              favorite_album.tap do |album|
                album.image_url = @args[:image_url]
                album.save
              end
            end

            def favorite_album
              @favorite_album ||=
                profile.favorite_albums.where(
                  album_id: find_album.id
                ).first_or_initialize
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist_name]
            end

            def errors?
              favorite_album.errors.any?
            end
          end
        end
      end
    end
  end
end
