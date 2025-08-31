module Spotify
  module Utils
    module Audio
      class Link
        class File
          class GroupMatcher < Spotify::Utils::Audio::Link::File
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                file_group
              ]
            end

            def matched_group?
              in_allowed_countries? &&
                not_in_forbidden_countries?
            end

            def in_allowed_countries?
              allowed_countries.nil? ||
                country_in_countries_list?(
                  allowed_countries
                )
            end

            def allowed_countries
              @allowed_countries ||=
                file_group.dig(
                  'restriction',
                  0,
                  'countries_allowed'
                )
            end

            def file_group
              @args[:file_group]
            end

            def country_in_countries_list?(string)
              string
                .scan(
                  /.{2}/
                )
                .include?(
                  COUNTRY_CODE
                )
            end

            def not_in_forbidden_countries?
              forbidden_countries.nil? ||
                !country_in_countries_list?(
                  forbidden_countries
                )
            end

            def forbidden_countries
              @forbidden_countries ||=
                file_group.dig(
                  'restriction',
                  0,
                  'countries_forbidden'
                )
            end

            alias data matched_group?
          end
        end
      end
    end
  end
end
