module Yandex
  module Music
    class Base < Muffon::Base
      def call
        return handlers.bad_request if not_all_args?
        return handlers.not_found if no_data?

        data
      end

      private

      def response_data
        @response_data ||= JSON.parse(response)
      end

      def response
        RestClient.get(link, headers)
      end

      def headers
        { params: params }
      end

      def full_title(data)
        return data['title'] if data['version'].blank?

        "#{data['title']} (#{data['version']})"
      end

      def artist_name(data)
        data['artists'].map { |a| a['name'] }.join(', ')
      end

      def title
        response_data['title']
      end

      def artist_data
        { name: artist_name(response_data) }
      end

      def image_data(data, model)
        Yandex::Music::Utils::Image.call(data: data, model: model)
      end

      def length(track)
        track['durationMs'] / 1_000
      end
    end
  end
end
