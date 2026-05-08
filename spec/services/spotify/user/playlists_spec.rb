RSpec.describe Spotify::User::Playlists do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/user/playlists/success'
        ) do
          subject.call(
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to match_hash(spotify_user_playlists_data) }
    end
  end
end
