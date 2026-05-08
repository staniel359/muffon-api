RSpec.describe Spotify::User::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette(
          'services/spotify/user/info/success'
        ) do
          subject.call(
            counters: ['tracks']
          )
        end
      end

      it { expect(output).to match_hash(spotify_user_info_data) }
    end
  end
end
