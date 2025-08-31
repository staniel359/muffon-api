RSpec.describe Spotify::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/album/links/success'
        ) do
          subject.call(
            album_id: '3OYnManu1Nlxnw9OMng7BH'
          )
        end
      end

      it { expect(output).to eq(spotify_album_links_data) }
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/album/links/wrong_id'
        ) do
          subject.call(
            album_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
