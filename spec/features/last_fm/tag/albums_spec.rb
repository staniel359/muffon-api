require 'rails_helper'

RSpec.describe LastFM::Tag::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/albums/success' do
          subject.call(tag: 'dream pop', page: 2)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Tag.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no tag name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong tag name' do
      let(:output) do
        VCR.use_cassette 'lastfm/tag/albums/wrong_name' do
          subject.call(tag: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
