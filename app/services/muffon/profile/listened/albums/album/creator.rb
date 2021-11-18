module Muffon
  module Profile
    module Listened
      module Albums
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

              process_listened_album

              return errors_data if errors?

              { listened_id: listened_album.id }
            end

            def process_listened_album
              listened_album.tap do |album|
                album.image_url = @args[:image_url]
                album.save
              end
            end

            def listened_album
              @listened_album ||=
                profile.listened_albums.where(
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
              listened_album.errors.any?
            end
          end
        end
      end
    end
  end
end
