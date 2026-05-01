module YouTubeMusic
  module Utils
    module Search
      class ScopeParams < YouTubeMusic::Base
        SCOPES_TITLES_DATA = {
          'artists' => 'Artists',
          'albums' => 'Albums',
          'tracks' => 'Songs',
          'videos' => 'Videos',
          'mixes' => 'Featured playlists',
          'playlists' => 'Community playlists'
        }.freeze

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            query
            scope
          ]
        end

        def data
          scope_data&.dig(
            'navigationEndpoint',
            'searchEndpoint',
            'params'
          )
        end

        def scope_data
          scopes&.find do |scope|
            matched_scope?(scope)
          end
        end

        def scopes
          raw_scopes&.pluck(
            'chipCloudChipRenderer'
          )
        end

        def raw_scopes
          response_data.dig(
            'contents',
            'tabbedSearchResultsRenderer',
            'tabs',
            0,
            'tabRenderer',
            'content',
            'sectionListRenderer',
            'header',
            'chipCloudRenderer',
            'chips'
          )
        end

        def request_url
          "#{REQUEST_BASE_URL}/search"
        end

        def request_payload
          {
            context: payload_context_data,
            query: @args[:query]
          }.to_json
        end

        def matched_scope?(scope)
          scope['uniqueId'] == scope_title
        end

        def scope_title
          SCOPES_TITLES_DATA[@args[:scope]]
        end
      end
    end
  end
end
