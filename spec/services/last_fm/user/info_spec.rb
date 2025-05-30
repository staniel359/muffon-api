RSpec.describe LastFM::User::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/user/info/success' do
          subject.call(nickname: 'cornwell_93', counters: ['plays'])
        end
      end

      it { expect(output).to eq(Helpers::LastFM::User.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no user nickname given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong user nickname' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/user/info/wrong_nickname' do
          subject.call(nickname: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
