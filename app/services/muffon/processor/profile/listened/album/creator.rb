module Muffon
  module Processor
    module Profile
      module Listened
        module Album
          class Creator < Muffon::Processor::Profile::Listened::Base
            include Muffon::Utils::Album

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist_name]
              ]
            end

            def process_listened
              listened_album

              return listened_album.errors_data if
                listened_album.errors?

              process_image

              { listened_id: listened_album.id }
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

            def process_image
              listened_album.process_image(
                @args[:image_url]
              )
            end
          end
        end
      end
    end
  end
end
