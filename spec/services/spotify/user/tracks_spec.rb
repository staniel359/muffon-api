RSpec.describe Spotify::User::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette 'services/spotify/user/tracks/success' do
          subject.call(access_token: 'BQBjHfZ7UMV_cIkI7dfKNtVmCSDxOgiL2rWHR4wvzswNRexjZciby_yw9wUivc94hi9lCK95jG1a-c3VcCx8krS5nKXSQer_TM_padBcVps-WACsRg83LYbN9nqITUuejLV1wyjLHL3JPOjpWBOLjfhqXI9tMTpVllbat4AMU2Hn3s2mSAziHUkytkg4Anty8chzUO25KR0xesxVWVteJmEKm0iwYIQEidcU', page: 2, limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::Spotify::User.tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when no user access_token given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong user access_token' do
      let(:output) do
        VCR.use_cassette 'services/spotify/user/tracks/wrong_token' do
          subject.call(access_token: random, page: 2, limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
