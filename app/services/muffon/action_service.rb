module Muffon
  class ActionService < Muffon::Base
    def call
      data
    end

    private

    def data
      [folder_name, file_name].join('/').camelize.safe_constantize
    end

    def folder_name
      exceptions[controller_name] || controller_name
    end

    def exceptions
      {
        'lastfm/artist/album' => 'lastfm/album',
        'lastfm/artist/track' => 'lastfm/track',
        'spotify/artist/album' => 'spotify/album',
        'spotify/artist/track' => 'spotify/track'
      }
    end

    def controller_name
      @args.controller.sub(
        'api/v1/', ''
      ).split('/').map(&:singularize).join('/')
    end

    def file_name
      @args.action
    end
  end
end
