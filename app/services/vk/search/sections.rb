module VK
  module Search
    class Sections < VK::Search::Base
      private

      def no_data?
        super || section_ids_list.blank?
      end

      def params
        {
          act: 'section',
          al: 1,
          owner_id: vk_owner_id,
          q: @args.query
        }
      end

      def section_ids_list
        @section_ids_list ||= response_data.dig(
          1, 1, 'blockIds'
        )
      end

      def search_data
        { sections: sections_data }
      end

      def sections_data
        section_ids_list.map do |id|
          section_data_formatted(id)
        end.inject(:merge)
      end

      def section_data_formatted(section_id)
        VK::Search::Sections::Section.call(
          section_id: section_id,
          html_response_data: html_response_data
        )
      end

      def html_response_data
        @html_response_data ||= Nokogiri::HTML.parse(
          html_response
        )
      end

      def html_response
        response_data.dig(1, 0).remove(
          "<!--\n          -<>->"
        )
      end
    end
  end
end
