require 'rails_helper'

RSpec.describe Spotify::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'spotify/track/info/success' do
          subject.call(track_id: '29d0nY7TzCoi22XBqDQkiP')
        end
      end

      it { expect(output).to eq(Helpers::Spotify::Track.info_data) }
    end
  end

  describe 'no processing' do
    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'spotify/track/info/wrong_id' do
          subject.call(track_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
