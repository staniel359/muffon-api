RSpec.describe LastFM::User::Playlist::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when user and playlist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/tracks/success'
        ) do
          subject.call(
            nickname: 'cornwell_93',
            playlist_id: '12688648',
            page: '2'
          )
        end
      end

      it { expect(output).to eq(lastfm_user_playlist_tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no playlist_id given' do
      let(:output) do
        subject.call(
          nickname: 'cornwell_93'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no nickname given' do
      let(:output) do
        subject.call(
          playlist_id: '12688648'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong playlist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/tracks/wrong_id'
        ) do
          subject.call(
            nickname: 'cornwell_93',
            playlist_id: '111'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong nickname' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/tracks/wrong_nickname'
        ) do
          subject.call(
            nickname: random_string,
            playlist_id: '12688648'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
