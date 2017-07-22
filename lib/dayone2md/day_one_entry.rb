module DayOne2MD
  class DayOneEntry
    attr_reader :entry

    class << self
      def all(journal_dir)
        Dir.glob("#{journal_dir}/entries/*.doentry").map { |path| new(path) }
      end
    end

    def initialize(path)
      @entry = Plist.parse_xml(path)
    end

    def date
      entry.fetch('Creation Date')
    end

    def title
      content[/\A(.+)\n/,1]
    end

    def content
      @content ||= entry.fetch('Entry Text')
    end
  end
end
