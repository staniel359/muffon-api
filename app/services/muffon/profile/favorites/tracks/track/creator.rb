module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track
          class Creator < Muffon::Profile::Base
            include Muffon::Utils::Track

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

              favorite_track.tap do |track|
                track.album_id = find_album&.id
                track.image_url = @args.image_url
                track.save
              end

              return errors_data if errors?

              { favorite_id: favorite_track.id }
            end

            def favorite_track
              @favorite_track ||=
                profile.favorite_tracks.where(
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
              favorite_track.errors.any?
            end
          end
        end
      end
    end
  end
end
