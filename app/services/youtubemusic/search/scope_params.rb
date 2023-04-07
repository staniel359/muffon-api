module YouTubeMusic
  module Search
    class ScopeParams < YouTubeMusic::Search::Base
      SCOPES = {
        tracks: 'Songs',
        videos: 'Videos',
        mixes: 'Featured playlists',
        playlists: 'Community playlists'
      }.freeze

      private

      def primary_args
        [
          @args[:query],
          @args[:scope]
        ]
      end

      def data
        scope_data&.dig(
          'navigationEndpoint',
          'searchEndpoint', 'params'
        )
      end

      def scope_data
        scopes&.find do |s|
          matched_scope?(s)
        end
      end

      def scopes
        raw_scopes&.map do |s|
          s['chipCloudChipRenderer']
        end
      end

      def raw_scopes
        response_data.dig(
          'contents', 'tabbedSearchResultsRenderer',
          'tabs', 0, 'tabRenderer', 'content',
          'sectionListRenderer', 'header',
          'chipCloudRenderer', 'chips'
        )
      end

      def payload
        {
          context: context_data,
          query: @args[:query]
        }.to_json
      end

      def matched_scope?(scope)
        scope['uniqueId'] == scope_formatted
      end

      def scope_formatted
        SCOPES[
          @args[:scope].downcase.to_sym
        ]
      end
    end
  end
end
