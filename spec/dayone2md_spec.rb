require 'spec_helper'

describe 'dayone2md' do
  let(:command) { 'bundle exec exe/dayone2md' }
  subject { `#{command}` }

  context '--version' do
    subject { `#{command} --version`.strip }

    it 'returns current version' do
      expect(subject).to eq DayOne2MD::VERSION
    end
  end
end
