require 'rails_helper'

RSpec.describe Yandex::Music::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'yandex/music/track/info/success' do
          subject.call(track_id: '2203363')
        end
      end

      it { expect(output).to eq(Helpers::Yandex::Music::Track.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'yandex/music/track/info/wrong_id' do
          subject.call(track_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
