module Muffon
  module Profile
    module Library
      module Compatibility
        class Albums
          class Album < Muffon::Profile::Library::Compatibility::Albums
            def call
              data
            end

            private

            def data
              {
                id: id,
                title: title,
                artist: artist_data,
                image: image_data,
                tracks_count: tracks_count
              }.compact
            end

            def id
              profile_album.id
            end

            def profile_album
              @args[:profile_album]
            end

            def title
              profile_album
                .album
                .title
            end

            def artist_id
              profile_album.profile_artist_id
            end

            def artist_name
              profile_album
                .album
                .artist
                .name
            end

            def image_data
              profile_album.image_data
            end

            def tracks_count
              profile_album.profile_tracks_count
            end
          end
        end
      end
    end
  end
end
