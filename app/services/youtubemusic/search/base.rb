module YouTubeMusic
  module Search
    class Base < YouTubeMusic::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def data
        { search: search_data }
      end

      def raw_collection
        raw_data['contents']
      end

      def raw_data
        raw_first_page_data ||
          raw_next_page_data ||
          {}
      end

      def raw_first_page_data
        response_data.dig(
          'contents',
          'tabbedSearchResultsRenderer',
          'tabs',
          0,
          'tabRenderer',
          'content',
          'sectionListRenderer',
          'contents',
          0,
          'musicShelfRenderer'
        )
      end

      def link
        BASE_LINK
      end

      def payload
        {
          context: context_data,
          query: @args[:query],
          params: scope_params
        }.to_json
      end

      # rubocop:disable Layout/LineLength
      def params
        {
          continuation: @args[:page],
          ctoken: ('ErEDEgx3aWxkIG5vdGhpbmcaoANFZ1dLQVFJSUFVaGthaEFRQ1JBRUVBTVFDaEFWRUJBUURoQVJnZ0VMUzJwYWNuTnRSREUyWlRpQ0FRczNNM2xZVG05T1JFUktOSUlCQzJWVk9YRXdhRlpHTlVORmdnRUxUM1ZSWW1Ka1NERXpVR3VDQVF0VlgwaDFYMFZyYkd4aU1JSUJDM054ZW5CR1ppMTVhbTlqZ2dFTExYTjVSVXhSTm1waVNXdUNBUXQxVFVaM05IVmtjbVpDVVlJQkN6QkRTMWxVYzFrMVJUVk5nZ0VMZVdwak1GbE9jWGRSYlZtQ0FRc3RZWFp3UjBka1RtSkliNElCQzNVeVYzTndZVlF5Tm14cmdnRUxia1kxVjNsZlNERTRiRy1DQVF0dWRVOUROREpvWW5SS1ZZSUJDMWd3U1ZaVGRqVnBhemRWZ2dFTFoxTlJjbkZGZWtnM1JVR0NBUXRVYVhOWFExbFpVWFpxT0lJQkMwTjBMVzFKV1ZkSUxYVlpnZ0VMYTBoSVFXbGhVRUpJYlZHQ0FRczVaa05VVW10Q2VGZEJSUSUzRCUzRBjx6tAu' if @args[:page].present?)
        }.compact
      end
      # rubocop:enable Layout/LineLength

      def raw_next_page_data
        response_data.dig(
          'continuationContents',
          'musicShelfContinuation'
        )
      end

      def next_page
        raw_data.dig(
          'continuations',
          0,
          'nextContinuationData',
          'continuation'
        )
      end

      alias response post_response
    end
  end
end
