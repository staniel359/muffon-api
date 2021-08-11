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
                @args.title,
                @args.artist
              ]
            end

            def data
              return forbidden if wrong_profile?

              process_profile_album
              process_profile_track

              return errors_data if errors?

              process_track_image

              { library_id: profile_track.id }
            end

            def process_profile_album
              profile_album&.tap do |album|
                album.image_url = @args.image_url if
                    @args.image_url.present?
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
                find_artist.id, @args.album
              )
            end

            def find_artist
              @find_artist ||= ::Artist.with_name(
                @args.artist
              )
            end

            def profile_artist
              @profile_artist ||=
                profile.profile_artists.where(
                  artist_id: find_artist.id
                ).first_or_create
            end

            def process_profile_track
              profile_track.tap do |track|
                track.created_at = @args.created_at if
                    update_created_at?
                track.save
              end
            end

            def profile_track
              @profile_track ||=
                profile.profile_tracks.where(
                  track_id: find_track.id,
                  profile_artist_id: profile_artist.id,
                  profile_album_id: profile_album&.id
                ).first_or_initialize
            end

            def find_track
              ::Track.with_artist_title(
                find_artist.id, @args.title
              )
            end

            def update_created_at?
              return false if @args.created_at.blank?
              return true if profile_track.created_at.blank?

              @args.created_at <
                profile_track.created_at
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
                **image_data
              )
            end
          end
        end
      end
    end
  end
end