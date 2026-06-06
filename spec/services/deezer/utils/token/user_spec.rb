RSpec.describe Deezer::Utils::Token::User do
  subject { described_class }

  describe 'successful processing' do
    let(:output) do
      VCR.use_cassette(
        'services/deezer/utils/token/user/success'
      ) do
        subject.call
      end
    end

    it { expect(output).to eq(deezer_utils_user_token_data) }
  end
end
