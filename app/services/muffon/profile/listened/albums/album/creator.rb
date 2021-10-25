module Muffon
  module Profile
    module Listened
      module Albums
        module Album
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

              process_listened_album

              return errors_data if errors?

              { listened_id: listened_album.id }
            end

            def process_listened_album
              listened_album.tap do |album|
                album.image_url = @args.image_url
                album.save
              end
            end

            def listened_album
              @listened_album ||=
                profile.listened_albums.where(
                  album_id: @args.album_id
                ).first_or_initialize
            end

            def errors?
              listened_album.errors.any?
            end
          end
        end
      end
    end
  end
end
