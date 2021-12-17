module Muffon
  module Profile
    module Bookmarks
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

            bookmark_album

            return errors_data if errors?

            process_image

            { bookmark_id: bookmark_id }
          end

          def bookmark_album
            @bookmark_album ||=
              profile.bookmark_albums.where(
                album_id: find_album.id
              ).first_or_create
          end

          def artist_name
            @args[:artist_name]
          end

          def title
            @args[:title]
          end

          def errors?
            bookmark_album.errors.any?
          end

          def process_image
            bookmark_album.process_image(
              @args[:image_url]
            )
          end

          def bookmark_id
            bookmark_album.id
          end
        end
      end
    end
  end
end
