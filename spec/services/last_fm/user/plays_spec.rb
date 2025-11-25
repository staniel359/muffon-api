RSpec.describe LastFM::User::Plays do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/plays/success'
        ) do
          subject.call(
            nickname: 'cornwell_93',
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect(output).to eq(lastfm_user_plays_data) }
    end
  end

  describe 'no processing' do
    context 'when no user nickname given' do
      let(:output) { subject.call }

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong user nickname' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/user/plays/wrong_nickname'
        ) do
          subject.call(
            nickname: random_string,
            page: '2',
            limit: '5'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
