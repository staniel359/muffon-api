module Muffon
  module Processor
    module Profile
      module Bookmarks
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
              bookmark_album_record

              bookmark_album_record.update!(
                source_data: @args[:source]
              )

              bookmark_album_record.process_image_later(
                @args[:image]
              )

              { bookmark_album: bookmark_album_data }
            end

            def bookmark_album_record
              @bookmark_album_record ||=
                profile_record
                .bookmark_albums
                .where(
                  album_id: album_record.id
                )
                .first_or_initialize
            end

            def artist_name
              @args[:artist_name]
            end

            def title
              @args[:album_title]
            end

            def bookmark_album_data
              { id: bookmark_album_record.id }
            end
          end
        end
      end
    end
  end
end
