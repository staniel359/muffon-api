module Muffon
  module Utils
    module Formatters
      module Collection
        private

        def artists
          @artists ||=
            artists_list.map do |a|
              artist_data_formatted(a)
            end
        end

        def albums
          albums_list.map do |a|
            album_data_formatted(a)
          end
        end

        def tracks
          tracks_list.map do |t|
            track_data_formatted(t)
          end
        end

        def tags_truncated
          tags.first(5)
        end

        def tags
          tags_list.map do |t|
            tag_data_formatted(t)
          end
        end

        def tag_data_formatted(tag)
          { name: tag_name_formatted(tag) }
        end

        def tag_name_formatted(tag)
          case tag.class.name
          when 'String'
            tag
          when 'Hash'
            tag['name'] || tag['label']
          when 'Nokogiri::XML::Element'
            tag.text
          end
        end

        def library_tags_formatted(library_tags)
          tags = Tag.where(
            id: library_tags.pluck(:id)
          )

          library_tags.map do |t|
            format_library_tag(t, tags)
          end
        end

        def format_library_tag(library_tag, tags)
          tag = tags.find do |t|
            t.id == library_tag[:id]
          end

          library_tag[:name] = tag.name

          library_tag
        end

        def labels
          labels_list.map do |l|
            label_data_formatted(l)
          end.uniq
        end

        def label_data_formatted(label)
          label['name']
        end
      end
    end
  end
end
