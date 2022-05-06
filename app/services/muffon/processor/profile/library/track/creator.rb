module Muffon
  module Processor
    module Profile
      module Library
        module Track
          class Creator < Muffon::Processor::Profile::Library::Track::Base
            include Muffon::Utils::Track

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist_name]
              ]
            end

            def process_profile_track
              return forbidden if wrong_profile?

              update_profile_artist
              update_profile_album
              update_profile_track

              return profile_track.errors_data if
                  profile_track.errors?

              process_image

              { library_track: library_track_data }
            end

            def update_profile_artist
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

            def update_created_at?(model)
              return false if @args[:created_at].blank?
              return true if model.created_at.blank?

              @args[:created_at] < model.created_at
            end

            def update_profile_album
              return if profile_album.blank?

              profile_album.tap do |album|
                album.created_at = @args[:created_at] if
                    update_created_at?(album)
                album.save
              end
            end

            def profile_album
              return if album_title.blank?

              @profile_album ||=
                profile.profile_albums.where(
                  album_id: find_album.id,
                  profile_artist_id: profile_artist.id
                ).first_or_initialize
            end

            def album_title
              @args[:album_title]
            end

            def update_profile_track
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

            def process_image
              profile_album&.process_image(
                @args[:image_url] ||
                  @args[:image]
              )
            end

            def library_track_data
              { id: profile_track.id }
            end
          end
        end
      end
    end
  end
end
