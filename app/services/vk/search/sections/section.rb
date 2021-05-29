module VK
  module Search
    class Sections
      class Section < VK::Search::Sections
        TYPES = {
          'artists' => :artists,
          'albums' => :albums,
          'playlists' => :playlists,
          'clips' => :videos,
          'audios' => :tracks
        }.freeze

        def call
          data
        end

        private

        def data
          return {} if data_type.blank?

          { type_key => @args.section_id }
        end

        def data_type
          @data_type ||= data_class.match(
            /global_(\w+)/
          ).try(:[], 1)
        end

        def data_class
          @args.html_response_data.css(
            data_node_id_attr
          )[0]['class']
        end

        def data_node_id_attr
          "[data-id=#{@args.section_id}]"
        end

        def type_key
          TYPES[data_type]
        end
      end
    end
  end
end
