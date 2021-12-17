module Muffon
  module Profile
    module Listened
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

            listened_album

            return errors_data if errors?

            process_image

            { listened_id: listened_id }
          end

          def listened_album
            @listened_album ||=
              profile.listened_albums.where(
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
            listened_album.errors.any?
          end

          def process_image
            listened_album.process_image(
              @args[:image_url]
            )
          end

          def listened_id
            listened_album.id
          end
        end
      end
    end
  end
end
