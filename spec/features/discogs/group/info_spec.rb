require 'rails_helper'

RSpec.describe Discogs::Group::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when group_id given' do
      let(:output) do
        VCR.use_cassette 'discogs/group/info/success' do
          subject.call(group_id: '5319')
        end
      end

      it { expect(output).to eq(Helpers::Discogs::Group.info_data) }
    end

    context 'when multiple artists' do
      let(:output) do
        VCR.use_cassette 'discogs/group/info/multiple_artists' do
          subject.call(group_id: '1531968')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Discogs::Group.info_multiple_artists_data
        )
      end
    end

    context 'when different artists' do
      let(:output) do
        VCR.use_cassette 'discogs/group/info/different_artists' do
          subject.call(group_id: '992584')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Discogs::Group.info_different_artists_data
        )
      end
    end
  end

  describe 'no processing' do
    context 'when no group_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong group_id' do
      let(:output) do
        VCR.use_cassette 'discogs/group/info/wrong_id' do
          subject.call(group_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
