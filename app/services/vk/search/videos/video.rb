module VK
  module Search
    class Videos
      class Video < VK::Search::Videos
        def call
          data
        end

        private

        def data
          base_data.merge(extra_data)
        end

        def base_data
          {
            title: title,
            extra_title: extra_title,
            vk_id: vk_id,
            vk_hash: vk_hash,
            artists: artists
          }.compact
        end

        def title
          video.css(
            '.video_item_title'
          )[0].text.strip
        end

        def video
          @video ||= Nokogiri::HTML.parse(raw_video)
        end

        def raw_video
          @args.video.gsub(
            "<!--\n          -<>->", ''
          )
        end

        def extra_title
          video.css('.mv_subtitle')[0]&.text
        end

        def vk_id
          video.css('.video_item')[0]['data-id']
        end

        def vk_hash
          video.css(
            '.video_item'
          )[0]['data-add-hash']
        end

        def artists
          artists_list.map do |a|
            artist_data_formatted(a)
          end
        end

        def artists_list
          video.css('.video_item_author a')
        end

        def artist_data_formatted(artist)
          {
            name: artist.text,
            vk_slug: artist_vk_slug(artist)
          }
        end

        def artist_vk_slug(artist)
          artist['href'].match(
            %r{/artist/(.+)}
          )[1]
        end

        def extra_data
          {
            image: image_data,
            duration: duration,
            publish_date: publish_date,
            tags: tags
          }
        end

        def image_data
          image_data_formatted(raw_image, 'video')
        end

        def raw_image
          video.css(
            '.video_item_thumb'
          )[0]['data-thumb']
        end

        def duration
          duration_formatted(raw_duration)
        end

        def raw_duration
          video.css(
            '.video_thumb_label_item'
          )[-1].text
        end

        def publish_date
          date_formatted(raw_publish_date)
        end

        def raw_publish_date
          video.css('.video_item_views')[0].text
        end

        def tags_list
          [video.css(
            '.video_item_updated'
          )[0].text]
        end
      end
    end
  end
end
