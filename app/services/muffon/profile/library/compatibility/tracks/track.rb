module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks
          class Track < Muffon::Profile::Library::Compatibility::Tracks
            def call
              data
            end

            private

            def data
              {
                id: id,
                title: title,
                artist: artist_data,
                image: image_data
              }.compact
            end

            def id
              profile_track.id
            end

            def profile_track
              @args[:profile_track]
            end

            def title
              profile_track
                .track
                .title
            end

            def artist_id
              profile_track.profile_artist_id
            end

            def artist_name
              profile_track
                .track
                .artist
                .name
            end

            def image_data
              profile_album&.image_data
            end

            def profile_album
              profile_track.profile_album
            end
          end
        end
      end
    end
  end
end
