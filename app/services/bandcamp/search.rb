module Bandcamp
  class Search < Bandcamp::Base
    private

    def primary_args
      [@args.query]
    end

    def no_data?
      search_response.blank?
    end

    def search_response
      @search_response ||= Bing::Search.call(params)[:search]
    end

    def params
      { query: query, page: @args.page }
    end

    def query
      "#{@args.query} site:bandcamp.com"
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: search_response[:page],
        albums: albums
      }
    end

    def albums
      results_filtered.map do |r|
        {
          title: r[:title],
          link: r[:link]
        }
      end
    end

    def results_filtered
      search_response[:results].select do |r|
        r[:link][%r{/(album|track)/}].present?
      end
    end
  end
end
