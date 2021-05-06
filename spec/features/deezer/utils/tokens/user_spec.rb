require 'rails_helper'

RSpec.describe Deezer::Utils::Tokens::User do
  subject { described_class }

  describe 'successful processing' do
    context 'when no args given' do
      let(:output) do
        VCR.use_cassette 'deezer/utils/tokens/user/success' do
          subject.call
        end
      end

      it { expect(output).to eq(Helpers::Deezer::Utils::Tokens.user_data) }
    end
  end
end
