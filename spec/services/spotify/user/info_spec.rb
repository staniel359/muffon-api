RSpec.describe Spotify::User::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when user exists' do
      let(:output) do
        VCR.use_cassette 'services/spotify/user/info/success' do
          subject.call(access_token: 'BQDXlski5Nk80PjNwaSTw-Qr_gz0Eche_x0o7gnXRR5CoX1DQqIKYRhKnmJru0RMmzYVB76yvwuI9AlwzRh1ePUoNZ4zVylJfZ5p0U8XafJoAp1aGBO2POMSyVbQoZHM7-gcSike96ET6NP3o-5r_doPt0PtRoH2kPmIeP0kms01KQY6IqmCJ1z-jpQGI8cx_qSQJcNVEgA2kRoDUB3iZavdOqy8y66fnhpu')
        end
      end

      it { expect(output).to eq(Helpers::Spotify::User.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no access_token given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong access_token' do
      let(:output) do
        VCR.use_cassette 'services/spotify/user/info/wrong_token' do
          subject.call(access_token: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
