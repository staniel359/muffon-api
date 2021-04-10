module VK
  module Search
    class Sections < VK::Search::Base
      private

      def no_data?
        super || sections.blank?
      end

      def params
        {
          act: 'section',
          al: 1,
          owner_id: secrets.vk[:page_id],
          q: @args.query
        }
      end

      def sections
        @sections ||= response_data.dig(1, 1)
      end

      def search_data
        { sections: sections_data }
      end

      def sections_data
        sections_list.map do |id|
          section_data(id)
        end.inject(:merge)
      end

      def sections_list
        sections['blockIds']
      end

      def section_data(id)
        { type_keys[data_type(id)] => id }
      end

      def data_type(id)
        data_class(id).match(/global_(\w+)/).try(:[], 1).to_s
      end

      def data_class(id)
        html_response_data.css("[data-id=#{id}]")[0].attr('class')
      end

      def html_response_data
        Nokogiri::HTML.parse(
          response_data.dig(1, 0).gsub(
            "<!--\n          -<>->", ''
          )
        )
      end

      def type_keys
        {
          'artists' => :artists,
          'albums' => :albums,
          'playlists' => :playlists,
          'clips' => :videos,
          'audios' => :tracks,
          '' => :placeholder
        }
      end
    end
  end
end
