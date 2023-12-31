RSpec.describe Spotify::Utils::User::AccessToken do
  subject { described_class }

  describe 'successful processing' do
    context 'when code present' do
      let(:output) do
        VCR.use_cassette 'services/spotify/utils/user/access_token/success' do
          subject.call(code: 'AQDGa0bdN78TsPy9yKGcmngXKeA0_p2UW7Gxodf0Wi4i2i8wr8vmRHa6mvpn2vZeBlRprDFJJeW8tkEuOh9lyCxM1C3Ks9HYqwcf7wbZn69P8WdNz4XH48T0GgBwe0l7GOD_Q27l7WMWcpNoIpUW2WK1WcMuMCFrripsLAQ-7D8UXRg9ygv_XH6r9Y-JDdnH-ZPqHt9mcEhKciV20mZVNRI4cOk')
        end
      end

      it { expect(output).to eq(Helpers::Spotify::Utils.user_access_token_data) }
    end
  end

  describe 'no processing' do
    context 'when no code given' do
      let(:output) { subject.call }

      it { expect(output).to be_nil }
    end

    context 'when wrong code' do
      let(:output) do
        VCR.use_cassette 'services/spotify/utils/user/access_token/wrong_code' do
          subject.call(code: random)
        end
      end

      it { expect(output).to be_nil }
    end
  end
end
