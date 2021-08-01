module Muffon
  module Profile
    module Library
      class Albums
        class Album
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

              profile_album

              return errors_data if errors?

              process_tracks

              { library_id: profile_album.id }
            end

            def profile_album
              @profile_album ||=
                profile.profile_albums.where(
                  album_id: find_album.id,
                  profile_artist_id: profile_artist.id
                ).first_or_create(
                  image_url: @args.image_url
                )
            end

            def find_album
              ::Album.with_artist_title(
                find_artist.id, @args.title
              )
            end

            def find_artist
              @find_artist ||= ::Artist.with_name(
                @args.artist
              )
            end

            def profile_artist
              profile.profile_artists.where(
                artist_id: find_artist.id
              ).first_or_create
            end

            def errors?
              profile_album.errors.any?
            end

            def process_tracks
              return if @args.tracks.blank?

              @args.tracks.each do |t|
                process_track(t)
              end
            end

            def process_track(track)
              Muffon::Profile::Library::Albums::Album::Creator::Track.call(
                track: track,
                profile_id: @args.profile_id,
                profile_album_id: profile_album.id
              )
            end
          end
        end
      end
    end
  end
end
