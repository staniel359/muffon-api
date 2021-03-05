require 'rails_helper'

RSpec.describe Genius::Track::Lyrics do
  subject { described_class }

  describe 'successful processing' do
    context 'when path present' do
      let(:output) do
        VCR.use_cassette 'genius/track/lyrics/success' do
          subject.call(path: 'Molly-nilsson-ugly-girl-lyrics')
        end
      end

      it { expect(output).to eq(Helpers::Genius::Track.lyrics_data) }
    end
  end

  describe 'no processing' do
    context 'when no path given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong path' do
      let(:output) do
        VCR.use_cassette 'genius/track/lyrics/wrong_path' do
          subject.call(path: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
