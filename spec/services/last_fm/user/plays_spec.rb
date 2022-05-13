RSpec.describe LastFM::User::Plays do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/user/plays/success' do
          subject.call(nickname: 'cornwell_93', page: 2, limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::User.plays_data) }
    end
  end

  describe 'no processing' do
    context 'when no user nickname given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong user nickname' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/user/plays/wrong_nickname' do
          subject.call(nickname: random, page: 2, limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
