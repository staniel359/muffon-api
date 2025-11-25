module LastFM
  module User
    module Playlist
      class Info < LastFM::User::Web::Base
        private

        def required_args
          super + %i[
            playlist_id
          ]
        end

        def user_data
          { playlist: playlist_data }
        end

        def link
          "#{base_link}/playlists/#{@args[:playlist_id]}"
        end

        def playlist_data
          {
            title:,
            tracks_count:,
            tracks:
          }
        end

        def title
          response_data.css(
            '.playlisting-playlist-header-title'
          )[0].text
        end

        def tracks_count
          tracks.size
        end

        def tracks
          @tracks ||= retrieve_tracks
        end

        def retrieve_tracks
          collection = []
          page = 1

          loop do
            new_page_collection =
              retrieve_page_tracks(page)

            break if new_page_collection.blank?

            collection += new_page_collection

            page += 1
          end

          format_tracks_collection(collection)
        end

        def retrieve_page_tracks(page)
          LastFM::User::Playlist::Tracks.call(
            nickname: @args[:nickname],
            playlist_id: @args[:playlist_id],
            skip_profile: true,
            page:
          )[:tracks]
        end

        def format_tracks_collection(collection)
          collection.uniq do |t|
            t.dig(
              :source, :links, :original
            )
          end
        end
      end
    end
  end
end
