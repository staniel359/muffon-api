RSpec.describe Spotify::Utils::Audio::Link::Token do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette 'services/spotify/utils/audio/link/token/success' do
        subject.call
      end
    end

    it { expect(output).to eq(Helpers::Spotify::Utils.audio_link_token) }
  end
end
