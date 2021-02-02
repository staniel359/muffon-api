module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if invalid_link? || no_data?

      yield if block_given?

      data
    end

    private

    def primary_args
      [@args.link]
    end

    def invalid_link?
      @args.link && @args.link[link_regexp].blank?
    end

    def link_regexp
      %r{(https?://)*\w+(?:-\w+)*.bandcamp.com/
        (?:album|track)/(\w|-)+(?:-\w+)*}x
    end

    def no_data?
      scripts.blank?
    end

    def scripts
      @scripts ||= response_data.css('script')
    end

    def response_data
      Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(@args.link)
    end

    def base_data
      @base_data ||= JSON.parse(scripts[0])
    end

    def extra_data
      @extra_data ||=
        JSON.parse(scripts[3]['data-tralbum'])
    end

    def tracks_list
      @tracks_list ||= extra_data['trackinfo']
    end

    def images_data
      Bandcamp::Utils::Images.call(
        image_id: extra_data['art_id']
      )
    end

    def artist_name
      base_data.dig('byArtist', 'name')
    end

    def title
      base_data['name']
    end

    def artist_data
      { name: artist_name }
    end
  end
end
