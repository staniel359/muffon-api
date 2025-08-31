RSpec.describe LastFM::User::Playlist::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when user and playlist exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/info/success'
        ) do
          subject.call(
            nickname: 'filipporomani',
            playlist_id: '12688634',
            with_tracks: true
          )
        end
      end

      it { expect(output).to eq(lastfm_user_playlist_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no playlist_id given' do
      let(:output) do
        subject.call(
          nickname: 'filipporomani'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no nickname given' do
      let(:output) do
        subject.call(
          playlist_id: '12688634'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong playlist_id' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/info/wrong_id'
        ) do
          subject.call(
            nickname: 'filipporomani',
            playlist_id: '111'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong nickname' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/playlist/info/wrong_nickname'
        ) do
          subject.call(
            nickname: random_string,
            playlist_id: '12688634'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
