RSpec.describe Spotify::Utils::Audio::Link do
  subject { described_class }

  describe 'successful processing' do
    context 'when track_id present' do
      let(:output) do
        VCR.use_cassette 'services/spotify/utils/audio/link/success' do
          subject.call(track_id: '3BRfgsKjcakny2wCYfZrvz', client_version: '2.2.0')
        end
      end

      it { expect(output).to eq(Helpers::Spotify::Utils.audio_link) }
    end
  end

  describe 'no processing' do
    context 'when no track_id given' do
      let(:output) { subject.call }

      it { expect(output).to be_nil }
    end

    context 'when wrong track_id' do
      let(:output) do
        VCR.use_cassette 'services/spotify/utils/audio/link/wrong_id' do
          subject.call(track_id: random)
        end
      end

      it { expect(output).to be_nil }
    end
  end
end
