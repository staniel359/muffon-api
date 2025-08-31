RSpec.describe Spotify::Playlist::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when playlist_id present' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/playlist/info/success'
        ) do
          subject.call(
            playlist_id: '3jPx5nmC1q0j39biB2ZdDi',
            profile_id: 1
          )
        end
      end

      it { expect(output).to eq(spotify_playlist_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no playlist_id given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong playlist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/playlist/info/wrong_id'
        ) do
          subject.call(
            playlist_id: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
