require 'rails_helper'

RSpec.describe LastFM::Top::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/top/tags/success' do
          subject.call(limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Top.tags_data) }
    end
  end
end
