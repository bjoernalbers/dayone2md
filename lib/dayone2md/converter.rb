module DayOne2MD
  class Converter
    attr_reader :opts

    def initialize(opts={})
      @opts = opts
    end

    def run
      DayOneEntry.all(opts[:input]).each do |entry|
        MarkdownEntry.new(
          date:     entry.date,
          title:    entry.title,
          content:  entry.content,
          dir:      opts[:output]
        ).save
      end
    end
  end
end
