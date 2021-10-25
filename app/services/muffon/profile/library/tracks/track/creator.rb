module Muffon
  module Profile
    module Library
      class Tracks
        class Track
          class Creator < Muffon::Profile::Library::Base
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

              process_profile_artist
              process_profile_album
              process_profile_track

              return errors_data if errors?

              process_track_image

              { library_id: profile_track.id }
            end

            def process_profile_artist
              profile_artist.tap do |artist|
                artist.created_at = @args.created_at if
                    update_created_at?(artist)
                artist.save
              end
            end

            def profile_artist
              @profile_artist ||=
                profile.profile_artists.where(
                  artist_id: find_track.artist_id
                ).first_or_initialize
            end

            def find_track
              @find_track ||= ::Track.find_by(
                id: @args.track_id
              )
            end

            def process_profile_album
              profile_album&.tap do |album|
                album.image_url = @args.image_url if
                    @args.image_url.present?
                album.created_at = @args.created_at if
                    update_created_at?(album)
                album.save
              end
            end

            def profile_album
              return if @args.album.blank?

              @profile_album ||= profile.profile_albums.where(
                album_id: find_album.id,
                profile_artist_id: profile_artist.id
              ).first_or_initialize
            end

            def find_album
              ::Album.with_artist_title(
                find_track.artist_id, @args.album
              )
            end

            def process_profile_track
              profile_track.tap do |track|
                track.created_at = @args.created_at if
                    update_created_at?(track)
                track.save
              end
            end

            def profile_track
              @profile_track ||=
                profile.profile_tracks.where(
                  track_id: @args.track_id,
                  profile_artist_id: profile_artist.id,
                  profile_album_id: profile_album&.id
                ).first_or_initialize
            end

            def update_created_at?(model)
              return false if @args.created_at.blank?
              return true if model.created_at.blank?

              @args.created_at < model.created_at
            end

            def errors?
              profile_track.errors.any?
            end

            def process_track_image
              return if profile_album.blank?
              return remove_image if @args.image.blank?

              add_image
            end

            def remove_image
              profile_album.image.purge
            end

            def add_image
              profile_album.image.attach(
                **image_file_data
              )
            end
          end
        end
      end
    end
  end
end
