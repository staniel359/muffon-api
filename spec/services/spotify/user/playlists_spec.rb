RSpec.describe Spotify::User::Playlists do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/user/playlists/success'
        ) do
          subject.call(
            access_token: 'BQANUzbn0K51z78z7_e29hhFbN2uiqul9Jcy9NwSLzY87rQxV7Tqh4y7OZZV2uUofiCwWRXYLJZnWvImWG0O_Rmr-38-Au1srHCOYvSucLoFKsDls83Hv0Qri0QCEwhvzQWjLLkLIbcIuaCj2lYcThiHPe3jYw4G-g8s3IrSByYIlT7ykNvmEWybljfdR3fCb_9OZvUXBkvbdONCtD9Yam1io2IqkDYFBEyw',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(spotify_user_playlists_data) }
    end
  end

  describe 'no processing' do
    context 'when no user access_token given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong user access_token' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/user/playlists/wrong_token'
        ) do
          subject.call(
            access_token: random_string,
            profile_id: '1',
            token: '1'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
