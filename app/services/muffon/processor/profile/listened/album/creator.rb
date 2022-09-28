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
                @args[:artist]
              ]
            end

            def process_listened
              listened_album

              return listened_album.errors_data if
                listened_album.errors?

              { listened_album: listened_album_data }
            end

            def listened_album
              @listened_album ||=
                profile
                .listened_albums
                .where(
                  album_id: find_album.id
                ).first_or_create
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist]
            end

            def listened_album_data
              { id: listened_album.id }
            end
          end
        end
      end
    end
  end
end
