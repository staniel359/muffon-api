module Muffon
  module Profile
    class Info
      class Connections < Muffon::Profile::Info
        def call
          data
        end

        private

        def data
          return {} unless valid_profile?

          {
            connections: connections_data
          }.compact_blank
        end

        def connections_data
          {
            lastfm: lastfm_data
          }.compact
        end

        def lastfm_data
          return if lastfm_connection.blank?

          lastfm_connection.slice(
            :nickname,
            :premium,
            :image_url
          )
        end

        def lastfm_connection
          @lastfm_connection ||=
            profile.lastfm_connection
        end
      end
    end
  end
end
