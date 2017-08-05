if $STAGING

  class ASample

    class << self
      attr_accessor :list
      ASample.list = Array.new

      def to_json
        "[#{ASample.list.map {|e|
          puts "generate a sample [#{e.title}]"
          e.to_json}.join(',')}]"
      end

    end

    attr_accessor :title, :commands, :common_event
    def initialize(title, commands, common_event)
      @title = title
      @commands = commands
      @common_event = common_event
      ASample.list << self
    end

    def to_json
      cmds = @commands.map {|e| "'#{e}'"}.join(',')
      stitle = "'title':'#{@title}'"
      scommands = "'commands':[#{cmds}]"
      link = 'index.html#'
      thtml = EventPrinter::CommonEvent.build(@common_event, 1).return_html
      scommon = "'html':'#{thtml.gsub(/\\|'/) { |c| "\\#{c}" }}'"
      return "{#{stitle}, #{scommands}, #{scommon}}"
    end

  end

end
