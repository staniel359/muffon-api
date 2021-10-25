module Muffon
  module Profile
    module Bookmarks
      class Tracks
        class Track
          class Creator < Muffon::Profile::Base
            private

            def primary_args
              [
                @args.profile_id,
                @args.token,
                @args.track_id
              ]
            end

            def data
              return forbidden if wrong_profile?

              bookmark_track.tap do |track|
                track.album_id = find_album&.id
                track.image_url = @args.image_url
                track.save
              end

              return errors_data if errors?

              { bookmark_id: bookmark_track.id }
            end

            def bookmark_track
              @bookmark_track ||=
                profile.bookmark_tracks.where(
                  track_id: @args.track_id
                ).first_or_create
            end

            def find_album
              return if @args.album.blank?

              ::Album.with_artist_title(
                @args.artist_id, @args.album
              )
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
