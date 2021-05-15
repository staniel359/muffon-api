require 'rails_helper'

RSpec.describe LastFM::Artist::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/tags/success' do
          subject.call(artist: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Artist.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong name' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/tags/wrong_name' do
          subject.call(artist: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
