require 'spec_helper'

module DayOne2MD
  describe DayOneEntry do
    let(:journal_dir) { 'spec/support/Journal_dayone' }

    subject { described_class.new("#{journal_dir}/entries/82BB9802AE374B97983C35EAD6ADB6AA.doentry") }

    describe '.all' do
      it 'returns all entries' do
        expect(described_class.all(journal_dir).count).to be > 0
      end

      it 'returns type of entry' do
        expect(described_class.all(journal_dir).first).to be_a described_class
      end
    end
    
    describe '#title' do
      it 'returns title' do
        expect(subject.title).to eq 'title'
      end
    end

    describe '#content' do
      it 'returns entry content' do
        expect(subject.content).to eq "title\n\ncontent"
      end

      it 'caches the value' do
        entry = double('entry')
        allow(entry).to receive(:fetch) { 'chunky bacon' }
        allow(subject).to receive(:entry) { entry }
        2.times { expect(subject.content).to eq 'chunky bacon' }
        expect(entry).to have_received(:fetch).with('Entry Text').once
      end
    end

    describe '#date' do
      it 'returns entry date' do
        expect(subject.date).to eq DateTime.parse('2013-03-17T10:11:13+00:00')
      end
    end
  end
end
