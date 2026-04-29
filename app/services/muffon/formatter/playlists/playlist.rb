module Muffon
  module Formatter
    module Playlists
      class Playlist < Muffon::Formatter::Playlist::Base
        DESCRIPTION_SIZE = 'extrasmall'.freeze

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            playlist_record
          ]
        end

        def data
          {
            id:,
            playlist_track_ids: playlist_tracks_ids,
            title:,
            profile: profile_data,
            private: private?,
            image: image_data,
            description:
              description_truncated_formatted,
            tracks_count:,
            created: creation_date
          }.compact
        end

        def description_truncated_formatted
          string_with_newlines_replaced_by_space(
            description_truncated
          )
        end
      end
    end
  end
end
