module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Creator < Muffon::Processor::Profile::Base
            include Muffon::Mixins::Album

            private

            def required_args
              [
                *super,
                :album_title,
                :artist_name
              ]
            end

            def data
              library_album_record

              library_album_record.update!(
                source_data: @args[:source]
              )

              library_album_record.process_image_later(
                @args[:image]
              )

              { library_album: library_album_data }
            end

            def library_album_record
              @library_album_record ||=
                profile_record
                .library_albums
                .where(
                  album_id: album_record.id,
                  library_artist_id: library_artist_record.id
                )
                .first_or_initialize
            end

            def title
              @args[:album_title]
            end

            def artist_name
              @args[:artist_name]
            end

            def library_artist_record
              profile_record
                .library_artists
                .where(
                  artist_id: album_record.artist_id
                )
                .first_or_create!
            end

            def library_album_data
              { id: library_album_record.id }
            end
          end
        end
      end
    end
  end
end
