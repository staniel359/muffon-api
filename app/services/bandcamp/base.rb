module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if invalid_link? || no_data?

      yield if block_given?

      data
    rescue *Muffon::Errors.list => e
      Muffon::Errors.handle(e.class)
    end

    private

    def invalid_link?
      link && link[bandcamp_link_regexp].blank?
    end

    def link
      @args.album_link || @args.track_link
    end

    def bandcamp_link_regexp
      %r{(https?://)*\w+(?:-\w+)*.bandcamp.com/
        (?:album|track)/(\w|-)+(?:-\w+)*}x
    end

    def response_data
      Nokogiri::HTML.parse(response)
    end

    def response
      RestClient.get(link)
    end

    def time_formatted(time)
      Time.zone.parse(time).strftime('%Y-%m-%d')
    end
  end
end
