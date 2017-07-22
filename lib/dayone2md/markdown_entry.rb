module DayOne2MD
  class MarkdownEntry
    include ActiveModel::Model
     
    attr_accessor :date, :title, :content

    validates :date, presence: true

    def filename
      s = [ formated_date ]
      s << formated_title if formated_title
      s.join(' ') + '.md'
    end

    def save
      valid? ? (write_file; true) : false
    end

    def dir=(dir)
      @dir = dir if dir
    end

    def dir
      @dir || Dir.pwd
    end

    private

    def write_file
      File.open(path, 'w') { |file| file << content }
    end

    def path
      File.join(dir, filename)
    end

    def formated_date
      date.strftime('%Y-%m-%d')
    end

    def formated_title
      title.gsub('/', '-') if title
    end
  end
end
