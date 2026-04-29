module Spotify
  module User
    class Playlists
      class Playlist < Spotify::User::Playlists
        include Spotify::Mixins::Playlist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_playlist_data
          ]
        end

        def data
          Muffon::Formatter::Source::Playlists::Playlist.call(
            source_original_link:,
            source_name:,
            source_playlist_id: spotify_id,
            title:,
            description:,
            image_data:,
            tracks_count:,
            tracks:
          )
        end

        def raw_playlist_data
          @args[:raw_playlist_data]
        end

        def tracks_count
          tracks&.size
        end

        def tracks
          return if @args[:with_tracks].blank?

          return [] if tracks_count_initial.zero?

          playlist_info_data[:tracks] || []
        end

        def tracks_count_initial
          raw_playlist_data.dig(
            'tracks',
            'total'
          ) || 0
        end

        def playlist_info_data
          @playlist_info_data ||=
            Spotify::Playlist::Info.call(
              playlist_id: spotify_id,
              profile_id: @args[:profile_id]
            ).try(
              :[],
              :playlist
            ) || {}
        end

        def images
          raw_playlist_data['images']
        end
      end
    end
  end
end
