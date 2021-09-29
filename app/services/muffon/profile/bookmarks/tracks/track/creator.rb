module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track
          class Creator < Muffon::Profile::Base
            include Muffon::Utils::Track

            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.title,
                @args.artist
              ]
            end

            def data
              return forbidden if wrong_profile?

              bookmark_track.tap do |track|
                track.image_url = @args.image_url
                track.album_id = find_album&.id
                track.save
              end

              return errors_data if errors?

              { bookmark_id: bookmark_track.id }
            end

            def bookmark_track
              @bookmark_track ||=
                profile.bookmark_tracks.where(
                  track_id: find_track.id
                ).first_or_create
            end

            def title
              @args.title
            end

            def artist_name
              @args.artist
            end

            def errors?
              bookmark_track.errors.any?
            end
          end
        end
      end
    end
  end
end
