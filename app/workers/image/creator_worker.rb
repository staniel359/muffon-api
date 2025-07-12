module Image
  class CreatorWorker < Worker::Base
    def perform(args)
      Muffon::Processor::Image::Creator.call(
        args_formatted(args)
      )
    end
  end
end
