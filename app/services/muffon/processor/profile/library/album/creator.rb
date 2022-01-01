module Muffon
  module Processor
    module Profile
      module Library
        module Album
          class Creator < Muffon::Processor::Profile::Library::Album::Base
            include Muffon::Utils::Album

            private

            def primary_args
              super + [
                @args[:title],
                @args[:artist_name]
              ]
            end

            def process_profile_album
              profile_album

              return profile_album.errors_data if
                  profile_album.errors?

              process_tracks
              process_image

              { library_id: profile_album.id }
            end

            def profile_album
              @profile_album ||=
                profile.profile_albums.where(
                  album_id: find_album.id,
                  profile_artist_id: profile_artist.id
                ).first_or_create
            end

            def title
              @args[:title]
            end

            def artist_name
              @args[:artist_name]
            end

            def profile_artist
              profile.profile_artists.where(
                artist_id: find_album.artist_id
              ).first_or_create
            end

            def process_tracks
              return if @args[:tracks].blank?

              @args[:tracks].each do |t|
                process_track(t)
              end
            end

            def process_track(track)
              Muffon::Processor::Profile::Library::Album::Creator::Track.call(
                track:,
                profile_id: @args[:profile_id],
                profile_album_id: profile_album.id
              )
            end

            def process_image
              profile_album.process_image(
                @args[:image_url]
              )
            end
          end
        end
      end
    end
  end
end
