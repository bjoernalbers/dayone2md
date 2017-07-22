require 'spec_helper'

describe 'dayone2md' do
  let(:command) { 'bundle exec exe/dayone2md' }
  subject { `#{command}` }
  
  context 'with input and output dir' do
    it 'exits successfully' do
      subject = system("#{command} -i spec/support/Journal_dayone -o tmp")
      expect(subject).to be true
    end

    it 'creates markdown file' do
      system("#{command} -i spec/support/Journal_dayone -o tmp")
      expect(File.exist?('tmp/2013-03-17 title.md')).to be true
    end
  end

  context '--version' do
    subject { `#{command} --version`.strip }

    it 'returns current version' do
      expect(subject).to eq DayOne2MD::VERSION
    end
  end
end
