module Muffon
  module Utils
    module Browser
      class SessionData < Muffon::Base
        SESSION_FILE_PATH =
          '/sessionstore-backups/recovery.jsonlz4'.freeze

        def call
          data
        end

        private

        def data
          JSON.parse(
            raw_session_data
          )
        end

        def raw_session_data
          `lz4jsoncat #{session_file_full_path}`
        end

        def session_file_full_path
          "#{browser_profile_path}#{SESSION_FILE_PATH}"
        end

        def browser_profile_path
          credentials.dig(
            :browser,
            :profile_path
          )
        end
      end
    end
  end
end
