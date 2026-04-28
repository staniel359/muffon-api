module Muffon
  module Processor
    module Profile
      module Listened
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
              listened_album_record

              { listened_album: listened_album_data }
            end

            def listened_album_record
              @listened_album_record ||=
                profile_record
                .listened_albums
                .where(
                  album_id: album_record.id
                )
                .first_or_create!
            end

            def title
              @args[:album_title]
            end

            def artist_name
              @args[:artist_name]
            end

            def listened_album_data
              { id: listened_album_record.id }
            end
          end
        end
      end
    end
  end
end
