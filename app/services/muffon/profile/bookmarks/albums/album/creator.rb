module Muffon
  module Profile
    module Bookmarks
      class Albums
        class Album
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

              process_bookmark_album

              return errors_data if errors?

              { bookmark_id: bookmark_album.id }
            end

            def process_bookmark_album
              bookmark_album.tap do |album|
                album.image_url = @args[:image_url]
                album.save
              end
            end

            def bookmark_album
              @bookmark_album ||=
                profile.bookmark_albums.where(
                  album_id: find_album.id
                ).first_or_initialize
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
          end
        end
      end
    end
  end
end
