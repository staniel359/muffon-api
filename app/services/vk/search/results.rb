module VK
  module Search
    class Results < VK::Search::Base
      private

      def params
        {
          act: 'section',
          al: 1,
          owner_id: secrets.vk[:page_id],
          q: @args.query
        }
      end

      def results
        @results ||= response_data.dig(1, 1)
      end

      def search_data
        { results: results_data }
      end

      def results_data
        results['blockIds'].map.with_object({}) do |data_id, hash|
          result_data(data_id, hash)
        end
      end

      def result_data(data_id, hash)
        type = type_formatted(data_type_name(data_id))

        hash[type.to_sym] = data_id if hash[type].blank?
      end

      def data_type_name(data_id)
        data_id_selector = "[data-id=#{data_id}]"

        html_response_data.css(data_id_selector)[0]['data-type']
      end

      def html_response_data
        Nokogiri::HTML.parse(
          response_data.dig(1, 0).gsub(
            "<!--\n          -<>->", ''
          )
        )
      end

      def type_formatted(type_name)
        case type_name
        when 'links' then 'artists'
        when 'music_playlists' then 'albums'
        when 'music_audios' then 'tracks'
        else type_name
        end
      end
    end
  end
end
