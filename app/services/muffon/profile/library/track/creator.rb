module Muffon
  module Profile
    module Library
      module Track
        class Creator < Muffon::Profile::Library::Base
          include Muffon::Utils::Track

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

            process_profile_artist

            process_profile_album

            process_profile_track

            return errors_data if errors?

            process_image

            { library_id: profile_track.id }
          end

          def process_profile_artist
            profile_artist.tap do |artist|
              artist.created_at = @args[:created_at] if
                  update_created_at?(artist)
              artist.save
            end
          end

          def profile_artist
            @profile_artist ||=
              profile.profile_artists.where(
                artist_id: find_artist.id
              ).first_or_initialize
          end

          def artist_name
            @args[:artist_name]
          end

          def process_profile_album
            return if profile_album.blank?

            profile_album.tap do |album|
              album.created_at = @args[:created_at] if
                  update_created_at?(album)
              album.save
            end
          end

          def profile_album
            return if album_title.blank?

            @profile_album ||= profile.profile_albums.where(
              album_id: find_album.id,
              profile_artist_id: profile_artist.id
            ).first_or_initialize
          end

          def album_title
            @args[:album_title]
          end

          def process_profile_track
            profile_track.tap do |track|
              track.created_at = @args[:created_at] if
                  update_created_at?(track)
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

          def title
            @args[:title]
          end

          def update_created_at?(model)
            return false if @args[:created_at].blank?
            return true if model.created_at.blank?

            @args[:created_at] < model.created_at
          end

          def errors?
            profile_track.errors.any?
          end

          def process_image
            profile_album&.process_image(
              @args[:image_url] || @args[:image]
            )
          end
        end
      end
    end
  end
end
