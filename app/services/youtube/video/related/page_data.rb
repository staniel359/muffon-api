module YouTube
  module Video
    class Related
      class PageData < YouTube::Video::Related
        def call
          data
        end

        private

        def data
          if @args[:page].present?
            next_page_data
          else
            first_page_data
          end
        end

        def next_page_data
          JSON.parse(
            next_page_response.body
          )
        end

        def next_page_response
          format_post_request(
            link: next_page_link,
            payload: next_page_payload
          )
        end

        def next_page_link
          'https://www.youtube.com/youtubei/v1/next'
        end

        def next_page_payload
          {
            context: context_data,
            continuation: @args[:page]
          }.to_json
        end

        def context_data
          { client: client_data }
        end

        def client_data
          {
            'gl' => 'GB',
            'clientName' => 'WEB',
            'clientVersion' =>
              '2.20230714.00.00'
          }
        end

        def first_page_data
          JSON.parse(
            first_page_script_json
          )
        end

        def first_page_script_json
          first_page_script
            .text
            .match(
              /ytInitialData = (.+);$/
            )[1]
        end

        def first_page_script
          first_page_scripts.find do |s|
            initial_data_script?(s)
          end
        end

        def first_page_scripts
          first_page_response_data.css(
            'script'
          )
        end

        def first_page_response_data
          Nokogiri::HTML.parse(
            first_page_response.body
          )
        end

        def first_page_response
          format_get_request(
            link: first_page_link,
            params: first_page_params
          )
        end

        def first_page_link
          'https://www.youtube.com/watch'
        end

        def first_page_params
          { v: @args[:video_id] }
        end

        def initial_data_script?(script)
          script
            .text
            .include?(
              'var ytInitialData'
            )
        end
      end
    end
  end
end
