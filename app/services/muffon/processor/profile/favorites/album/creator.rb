module Muffon
  module Processor
    module Profile
      module Favorites
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
              favorite_album_record

              favorite_album_record.update!(
                source_data: @args[:source]
              )

              favorite_album_record.process_image_later(
                @args[:image]
              )

              { favorite_album: favorite_album_data }
            end

            def favorite_album_record
              @favorite_album_record ||=
                profile_record
                .favorite_albums
                .where(
                  album_id: album_record.id
                )
                .first_or_initialize
            end

            def title
              @args[:album_title]
            end

            def artist_name
              @args[:artist_name]
            end

            def favorite_album_data
              { id: favorite_album_record.id }
            end
          end
        end
      end
    end
  end
end
