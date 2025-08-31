module LastFM
  module User
    class Playlists
      class Playlist < LastFM::User::Playlists
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            playlist
          ]
        end

        def data
          {
            source: source_data,
            title:,
            tracks_count:,
            tracks:
          }.compact
        end

        def source_data
          {
            name: source_name,
            id: lastfm_id,
            links: source_links
          }
        end

        def lastfm_id
          raw_lastfm_id.match(
            %r{/playlists/(.+)}
          )[1].to_i
        end

        def raw_lastfm_id
          playlist.css(
            '.playlisting-playlists-item-name'
          )[0].css(
            '.link-block-target'
          )[0]['href'].match(
            %r{(/user/.+)}
          )[0]
        end

        def playlist
          @args[:playlist]
        end

        def original_link
          "https://www.last.fm#{raw_lastfm_id}"
        end

        def title
          playlist.css(
            '.playlisting-playlists-item-name'
          )[0].text.strip
        end

        def tracks_count
          tracks&.size
        end

        def tracks
          return if @args[:with_tracks].blank?

          playlist_info_data[:tracks]
        end

        def playlist_info_data
          LastFM::User::Playlist::Info.call(
            nickname: @args[:nickname],
            playlist_id: lastfm_id,
            skip_profile: true,
            with_tracks: @args[:with_tracks]
          ).dig(
            :user, :playlist
          ) || {}
        end
      end
    end
  end
end
