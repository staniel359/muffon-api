require 'rails_helper'

RSpec.describe YandexMusic::Utils::Audio::Link do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id given' do
      let(:output) do
        VCR.use_cassette 'yandexmusic/utils/audio/link/success' do
          subject.call(track_id: '2203364')
        end
      end

      it { expect(output).to be_present }
    end
  end

  describe 'unsuccessful processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq('') }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'yandexmusic/utils/audio/link/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
