module Muffon
  module Profile
    module Favorites
      module Album
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

            favorite_album

            return errors_data if errors?

            process_image

            { favorite_id: favorite_id }
          end

          def favorite_album
            @favorite_album ||=
              profile.favorite_albums.where(
                album_id: find_album.id
              ).first_or_create
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

          def process_image
            favorite_album.process_image(
              @args[:image_url]
            )
          end

          def favorite_id
            favorite_album.id
          end
        end
      end
    end
  end
end
