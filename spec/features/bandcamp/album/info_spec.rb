require 'rails_helper'

RSpec.describe Bandcamp::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when link present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/success' do
          subject.call(
            link: 'wildnothingct.bandcamp.com/album/indigo'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.source_data) }
    end

    context 'when link present but redirected' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/redirect_success' do
          subject.call(
            link: 'luxuryelite.bandcamp.com/album/blind-date'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Album.redirect_data) }
    end
  end

  describe 'no processing' do
    context 'when no link given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/album/info/wrong_link' do
          subject.call(link: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
