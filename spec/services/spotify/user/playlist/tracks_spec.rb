RSpec.describe Spotify::User::Playlist::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when playlist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/user/playlist/tracks/success'
        ) do
          subject.call(
            playlist_id: '5RDmNvuz0prl7bLqtZNkDe',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to match_hash(spotify_user_playlist_tracks_data) }
    end
  end
end
