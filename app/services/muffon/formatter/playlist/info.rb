module Muffon
  module Formatter
    module Playlist
      class Info < Muffon::Formatter::Playlist::Base
        DESCRIPTION_SIZE = 'medium'.freeze

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
            title:,
            profile: profile_data,
            private: private?,
            image: image_data,
            description:,
            description_truncated:,
            tracks_count:,
            created: creation_date,
            **with_more_data
          }.compact
        end
      end
    end
  end
end
