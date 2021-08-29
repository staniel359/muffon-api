module Muffon
  module Profile
    module Library
      module Artist
        class Albums
          class Album < Muffon::Profile::Library::Artist::Albums
            def call
              data
            end

            private

            def data
              {
                id: id,
                title: title,
                image: image_data,
                tracks_count: tracks_count,
                created: created
              }
            end

            def id
              profile_album.id
            end

            def profile_album
              @profile_album ||= @args.album
            end

            def title
              profile_album
                .album
                .title
            end

            def image_data
              profile_album.image_data.presence ||
                default_image_data
            end

            def default_image_data
              LastFM::Utils::Image.call(
                model: 'album',
                image: profile_album.image_url
              )
            end

            def tracks_count
              profile_album.profile_tracks_count
            end

            def created
              datetime_formatted(
                profile_album.created_at
              )
            end
          end
        end
      end
    end
  end
end
