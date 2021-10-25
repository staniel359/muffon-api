module Muffon
  module Profile
    module Favorites
      class Albums
        class Album
          class Creator < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.album_id
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
                album.image_url = @args.image_url
                album.save
              end
            end

            def favorite_album
              @favorite_album ||=
                profile.favorite_albums.where(
                  album_id: @args.album_id
                ).first_or_initialize
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
