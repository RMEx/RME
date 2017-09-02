# -*- coding: utf-8 -*-
#==============================================================================
# ** RME DocGenerator
#------------------------------------------------------------------------------
# With:
#  Nuki
#  Grim
#  Joke
#
#==============================================================================

#==============================================================================
# ** Doc Generator
#------------------------------------------------------------------------------
#  Make the documentation of RME
#==============================================================================

module DocGenerator

  class << self
    #--------------------------------------------------------------------------
    # *  Create Json file
    #--------------------------------------------------------------------------
    def to_json
      result = Array.new
      RME::Doc.commands.each do |category, data|
        puts "Generate #{category}.json"
        json_data =
          [
            "{\"name\":\"#{data[:name]}\",\"desc\":\"#{data[:desc]}\",",
            "\"commands\":[\n#{rdoc(data[:commands])}\n]}"
          ].join('')
        result << json_data
      end
      a  = "var documentation = [\n" + result.join(",\n") + "\n];\n"
      puts "Generate Samples"
      a += 'var rme_samples = ' + ASample.to_json + ";\n"
    end

    # A continuer ! Gestion des paramètres et tout :D
    def rdoc(commands)
      kname = lambda{|x| (x =~ /.+\.(.+)/) && $1}
      res = Array.new
      commands.each do |name, data|
        puts "Generate #{name}.json"
        h =
          [
            "{\"name\":\"#{kname.(name)}\", ",
            "\"description\":\"#{data[:description]}\", ",
            "\"returnable\":#{data[:returnable]},",
            "\"parameters\":[#{params(data[:attributes])}]"
          ].join('')
        f = '}'
        res << h + f
      end
      res.join(",\n")
    end

    def params(parameters)
      res = Array.new
      parameters.each do |name, t|
        res << "{\"name\":\"#{name}\", \"desc\":\"#{t[0]}\", \"type\":\"#{t[1]}\"}"
      end
      return res.join(",\n")
    end
  end

  #==============================================================================
  # ** Doc Generator in Markdown
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module Markdown
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Markdown tags
    #--------------------------------------------------------------------------
    def header(t); ""; end
    def footer; ""; end
    def nl; "  \n"; end
    def np; "\n"*2; end
    def title(size, value); ("#"*size ) + " " + value.to_s + "\n"; end
    def strong(value); "**#{value}**"; end
    def strong_t(value, n=""); '##### '+value.to_s; end
    def italic(value); "*#{value}*"; end
    def ul; ""; end
    def end_ul; np; end
    def li(item); "*    #{item}"+"\n"; end
    def enum(t, v); li("**#{t}** : #{v}"); end
    def code(lang, snippet); "```#{lang}"+nl+snippet+nl+"```"; end
    def inline_code(c); "`#{c}`"; end
    def table(*titles)
      titles.join("|") + nl + (["---"] * titles.length).join(" | ") + nl
    end
    def tr(*values); values.join("|") + nl; end
    def end_table; ""; end
    def blockquote(s); "> #{s}"+np; end
    def link(text, url); "[#{text}](#{url.gsub(/\s/, '%20')})"; end
    def line; "  \n- - -  \n"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "README"; end
    def cmdindex; "Liste des commandes"; end
    def clindex; "Classes et modules"; end
    def extension; "md"; end
  end

  #==============================================================================
  # ** Doc Generator in HTML
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module HTML
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Markdown tags
    #--------------------------------------------------------------------------
    def header(t)
     "<!DOCTYPE html><html><head><meta charset='utf-8' /><title>#{t}</title></head>"
    end
    def footer; "</body></html>"; end
    def nl; "  \n"; end
    def np; "<br /><br />"; end
    def title(size, value); ("<h#{size}>") + value.to_s + "</h#{size}>\n"; end
    def strong(value); "<strong>#{value}</strong>"; end
    def strong_t(value, n=""); "<strong name='#{n}' id='#{n}'>#{value}</strong>"; end
    def italic(value); "<i>#{value}</i>"; end
    def ul; "<ul>"; end
    def end_ul; "</ul>"; end
    def li(item); "<li>#{item}</li>"+"\n"; end
    def enum(t, v); li("<strong>#{t}</strong> : #{v}"); end
    def code(lang, snippet); "<pre><code class='#{lang}'>"+nl+snippet+nl+"</code></pre>"; end
    def inline_code(c); "<code>#{c}</code>"; end
    def table(*titles)
      "<table border='1'><tr><th>" + titles.join("</th><th>") + "</th></tr>"
    end
    def tr(*values); "<tr><td>"+values.join("</td><td>") + "</td></tr>"; end
    def end_table; "</table>"; end
    def blockquote(s); "<blockquote>#{s}</blockquote>"; end
    def link(text, url); "<a href='#{url}'>#{text}</a>"; end
    def line; "<hr />"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "index"; end
    def cmdindex; "Liste des commandes"; end
    def clindex; "Classes et modules"; end
    def extension; "html"; end
  end

  #==============================================================================
  # ** Do
  #------------------------------------------------------------------------------
  #  Make the documentation of RME
  #==============================================================================

  module Do
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Index
    #--------------------------------------------------------------------------
    def index(mdl)
      mdl.index + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Command Index
    #--------------------------------------------------------------------------
    def cmdindex(mdl)
      mdl.cmdindex + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Class Index
    #--------------------------------------------------------------------------
    def clindex(mdl)
      mdl.clindex + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * File name
    #--------------------------------------------------------------------------
    def filename(mdl, classname)
      classname.to_s.gsub(":", "_").gsub(".", "_") + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Create Front page (header)
    #--------------------------------------------------------------------------
    def make_header(mdl)
      h = mdl.header("")
      t = mdl.title(1, RME::Doc.vocab[:title])
      d = RME::Doc.vocab[:desc] + mdl.np
      h + t + d
    end

    #--------------------------------------------------------------------------
    # * Create class page (header)
    #--------------------------------------------------------------------------
    def make_class_header(mdl, classname)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.link(RME::Doc.vocab[:cl_title], clindex(mdl))
      a = a + " > " + mdl.strong(classname)
      t = mdl.title(1, classname)
      d = RME::Doc.schema[classname][:description] + mdl.np
      h + a + mdl.line + t + d
    end

    #--------------------------------------------------------------------------
    # * Create Command page (header)
    #--------------------------------------------------------------------------
    def make_cmd_header(mdl, classname)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.link(RME::Doc.vocab[:cmd_title], cmdindex(mdl))
      a = a + " > " + mdl.strong(RME::Doc.commands[classname][:name])
      t = mdl.title(1, RME::Doc.commands[classname][:name])
      d = RME::Doc.commands[classname][:desc] + mdl.np
      h + a + mdl.line + t + d
    end

    #--------------------------------------------------------------------------
    # * Create attribute list
    #--------------------------------------------------------------------------
    def make_class_attributes(mdl, classname)
      k = RME::Doc.schema[classname][:attributes]
      if k.length > 0
        t = mdl.title 2, RME::Doc.vocab[:l_attr]
        t += mdl.table(RME::Doc.vocab[:l_name], RME::Doc.vocab[:l_desc])
        k.each do |atr, desc|
          t += mdl.tr(mdl.inline_code(atr), desc)
        end
        return t + mdl.end_table
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create Method list
    #--------------------------------------------------------------------------
    def make_class_methods(mdl, c, title_i = RME::Doc.vocab[:m_desc], title_c = RME::Doc.vocab[:m_list], proc = IDENTITY, snip = true)
      k = Hash[c.sort]
      if k.length > 0
        ls = mdl.title 2, title_c + mdl.ul
        t = mdl.title 2, title_i
        k.each do |name, data|
          desc = data[:description]
          atr = data[:attributes]
          ret = data[:returned]
          inline_args = ""
          inline_args2 = ""
          atr_list = ""
          atr_list = mdl.table(RME::Doc.vocab[:l_name], RME::Doc.vocab[:l_type], RME::Doc.vocab[:l_desc]) if atr.length > 0
          atr.each do |name, dt|
            inline_args2 += name.to_s + "-"
            inline_args += name.to_s+ ", "
            atr_list += mdl.tr(mdl.inline_code(name.to_s), mdl.inline_code(dt[1]), dt[0])
          end
          name = proc.call(name) || name
          atr_list += mdl.end_table
          inline_args = inline_args[0...-2]
          inline_args = (atr.length == 0 ? "" : "(#{inline_args})")
          inline_args2 = inline_args2[0...-1]
          name2 = name.to_s.gsub("*", "").gsub("?", "").gsub("!", "").gsub(".", "").downcase
          inline_args2 = (atr.length == 0 ? "" : "#{inline_args2}".gsub("*", "").gsub("?", "").gsub("!", "").gsub(".", "").downcase)
          t += mdl.strong_t("#{name}#{inline_args}", "#{name2}#{inline_args2}")
          snippet = ""
          snippet = mdl.np + make_class_snippet(mdl, c[name]) + mdl.np if snip
          t += mdl.np + mdl.blockquote(desc) + mdl.nl + atr_list + snippet
          ls += mdl.li(mdl.link("#{name}#{inline_args}", "#{'#'+"#{name2}#{inline_args2}"}"))
        end
        return ls + mdl.end_ul + t
      end
      return ""
    end

    #--------------------------------------------------------------------------
    # * Create Commands list
    #--------------------------------------------------------------------------
    def make_cmd_methods(mdl, classname)
      kname = lambda{|x| (x =~ /.+\.(.+)/) && $1}
      make_class_methods(mdl, classname, RME::Doc.vocab[:cmd_desc], RME::Doc.vocab[:cmd_list], kname, false)
    end

    #--------------------------------------------------------------------------
    # * Create Snippets
    #--------------------------------------------------------------------------
    def make_class_snippet(mdl, c)
      if c[:snippet]
        t = RME::Doc.vocab[:l_sample] + mdl.nl
        t += mdl.code("ruby", c[:snippet]) + mdl.np
        return t
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create class page
    #--------------------------------------------------------------------------
    def make_class_page(mdl, klass, index, output)
      name = filename(mdl, klass)
      index += mdl.li(mdl.link(klass, name))
      page = make_class_header(mdl, klass)
      page += make_class_attributes(mdl, klass)
      page += make_class_methods(mdl, RME::Doc.schema[klass][:methods])
      page += mdl.footer
      File.open("#{output}/#{name}", 'w') do |f|
        f.write(page)
      end
      p "#{name} created!"
      return index
    end

    #--------------------------------------------------------------------------
    # * Create command page
    #--------------------------------------------------------------------------
    def make_command_page(mdl, c, command, index, output)
      fname = filename(mdl, "command_#{c}")
      index += mdl.li(mdl.link(command[:name], fname))
      page = make_cmd_header(mdl, c)
      page += make_cmd_methods(mdl, RME::Doc.commands[c][:commands])
      page += mdl.footer
      File.open("#{output}/#{fname}", 'w') do |f|
        f.write(page)
      end
      p "#{fname} created!"
      return index
    end

    #--------------------------------------------------------------------------
    # * Create command index page
    #--------------------------------------------------------------------------
    def make_command_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.strong(RME::Doc.vocab[:cmd_title])
      l = mdl.ul
      Hash[RME::Doc.commands.sort].each do |c, command|
        l = make_command_page(mdl, c, command, l, output)
      end
      l += mdl.end_ul
      page = h + a + mdl.line + l + mdl.footer
      File.open(output + "/" + cmdindex(mdl), 'w'){|f| f.write(page)}
      p "#{cmdindex(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create class index page
    #--------------------------------------------------------------------------
    def make_class_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.link(RME::Doc.vocab[:index], index(mdl))
      a = a + " > " + mdl.strong(RME::Doc.vocab[:cl_title])
      l = mdl.ul
      Hash[RME::Doc.schema.sort].each do |klass, i|
        l = make_class_page(mdl, klass, l, output)
      end
      l += mdl.end_ul
      page = h + a + mdl.line + l + mdl.footer
      File.open(output + "/" + clindex(mdl), 'w'){|f| f.write(page)}
      p "#{clindex(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create index page
    #--------------------------------------------------------------------------
    def make_index_page(mdl, output)
      h = make_header(mdl)
      a = mdl.strong(RME::Doc.vocab[:index])
      l = mdl.ul
      l += mdl.li(mdl.link(RME::Doc.vocab[:cmd_title], cmdindex(mdl)))
      l += mdl.li(mdl.link(RME::Doc.vocab[:cl_title], clindex(mdl)))
      l += mdl.end_ul
      s = mdl.np + mdl.strong(RME::Doc.vocab[:links]) + mdl.line + mdl.ul
      RME::Doc.links.each{|k,v| s += mdl.li(mdl.link(k, v))}
      s += mdl.end_ul
      page = h + a + mdl.line + l + s + mdl.footer
      File.open(output + "/" + index(mdl), 'w'){|f| f.write(page)}
      p "#{index(mdl)} created!"
    end

    #--------------------------------------------------------------------------
    # * Create documentation
    #--------------------------------------------------------------------------
    def make(mdl, output)
      make_index_page(mdl, output)
      make_class_index_page(mdl, output)
      make_command_index_page(mdl, output)
    end

  end

  #--------------------------------------------------------------------------
  # *  Singleton
  #--------------------------------------------------------------------------
  class << self

    #--------------------------------------------------------------------------
    # *  Render Doc in Markdown
    #--------------------------------------------------------------------------
    def markdown(output)
      Do.make(Markdown, output)
    end
    #--------------------------------------------------------------------------
    # *  Render Doc in HTML
    #--------------------------------------------------------------------------
    def html(output)
      Do.make(HTML, output)
    end

  end

  #==============================================================================
  # ** Check
  #------------------------------------------------------------------------------
  #  Provide documentation fixer (for commands)
  #==============================================================================

  module Checker
    #--------------------------------------------------------------------------
    # *  Singleton
    #--------------------------------------------------------------------------
    class << self
      attr_accessor :documented_methods
      attr_accessor :undocumented_methods
      attr_accessor :orphans
      attr_accessor :raw_methods
      attr_accessor :commands
      #--------------------------------------------------------------------------
      # *  Run
      #--------------------------------------------------------------------------
      def run(output, out_gen, ee=nil)
        get_raw_methods
        Checker.documented_methods = Array.new
        Checker.undocumented_methods = Array.new
        Checker.orphans = Array.new
        Checker.commands = Command.singleton_methods - RME::Doc.internals
        get_raw_methods
        each_commands_methods
        save_report(output, out_gen)
        #ee_report(ee)
      end
      #--------------------------------------------------------------------------
      # *  Process EE report
      #--------------------------------------------------------------------------
      def ee_report(ee)
        g = ""
        eecmd = EE4::Command_Description.singleton_methods
        total = eecmd + Checker.commands
        eev = eecmd.length
        rmev = Checker.commands.select {|k| eecmd.include?(k)}.length
        total = total.uniq.sort.collect do |m|
          rme_call = "-"
          ee_call = "-"
          if eecmd.include?(m)
            ee_call = "#{m}"
            h = EE4::Command_Description.send(m)
            if h[:args] && h[:args].length > 0
              k = h[:args].collect{|a| ((a[:default]) ? "*" : "") + a[:name].downcase[/^\w*/]}
              ee_call += "(" +k.join(",")+")"
            end
          end
          if Command.singleton_methods.include?(m)
            rme_call = "#{m}"
            h = Command.method(m).parameters
            if h.length > 0
              k = h.collect{|k| ((k[0] == :req) ? "" : "*") + k[1].to_s}
              rme_call += "(" +k.join(",")+")"
            end
          end
          "#{rme_call}\t#{ee_call}"
        end
        g += total.join("\n")
        g = "RME\tEE(#{rmev}/#{eev})\n" + g
        FileTools.write(ee, g)
      end
      #--------------------------------------------------------------------------
      # *  Return all documented raw methods
      #--------------------------------------------------------------------------
      def get_raw_methods
        Checker.raw_methods = Array.new
        RME::Doc.commands.each do |category, cmds|
          all_cmds = cmds[:commands].keys.collect {|i| (i.to_s =~ /.+\.(.+)/) && $1}
          Checker.raw_methods += all_cmds.collect(&:to_sym)
        end
      end
      #--------------------------------------------------------------------------
      # *  Iteration on each methods
      #--------------------------------------------------------------------------
      def each_commands_methods
        Checker.documented_methods =
         Checker.commands.select {|i| raw_methods.include?(i)}
        Checker.undocumented_methods = Checker.commands - Checker.raw_methods
        Checker.undocumented_methods.delete(:method_missing)
        Checker.orphans =
          Checker.raw_methods - Checker.documented_methods - Checker.undocumented_methods
      end

      #--------------------------------------------------------------------------
      # *  Save report
      #--------------------------------------------------------------------------
      def save_report(o, b)
        g = ""
        r = "Report,\n"
        r += "\# #{RME::Doc.vocab[:documented]},"
        r += "#{Checker.documented_methods.length}/#{Checker.commands.length}\n,\n"
        r += "\# #{RME::Doc.vocab[:undocumented]},\# #{RME::Doc.vocab[:suggest]}\n"
        Checker.undocumented_methods.each do |c|
          m = RME::Doc.schema[:Command][:methods]["Command.#{c}".to_sym]
          t = "Commande documentée mais non enregistrée" if m
          n = RME::Doc.to_fix.collect {|i| (i.to_s =~ /.+\.(.+)/) && $1}
          n = n.collect(&:to_s).sort_by{|o| o.damerau_levenshtein(c.to_s)}
          t = "Modifier l'enregistrement [#{n[0]}] par  [#{c}]"  if n.length >= 1  && (n[0].damerau_levenshtein(c.to_s)) < 3
          t ||= "Aucune suggestion"
          r += "#{c},#{t}\n"
          if t == "Aucune suggestion"
            g += "\# AUTOGenerated for #{c}\n"
            g += "link_method_documentation 'Command.#{c}', \n"
            params = Command.method(c).parameters
            g += "\t'Your description',\n \t{"
            g += "\n" if params.length > 0
            # Get args
            args = Hash.new
            params.each do |p|
              g += "\t\t"
              g += ":\"*#{p[1]}\"" if p[0] == :opt || p[0] == :rest
              g += ":\"&#{p[1]}\"" if p[0] == :block
              g += ":#{p[1]}" if p[0] == :req
              g += " => [\"Args description\", :ArgType],\n"
            end
            g += "\n\t" if params.length > 0
            g += "}, true \# Maybe changed\n"
            g += "register_command :standard, 'Command.#{c}' \n\n"
          end
          FileTools.write(b, g)
        end
        r += ",\n\# #{RME::Doc.vocab[:orphans]},\# #{RME::Doc.vocab[:suggest]}\n"
        Checker.orphans.each do |c|
          keywords = Checker.undocumented_methods
          keywords.uniq!
          keywords.collect!{|i|i.to_s}
          keywords.sort_by!{|o| o.damerau_levenshtein(c.to_s)}
          s = (keywords.length >= 1) ? "Peut-être faudrait-il remplacer [#{c}] par [#{keywords[0]}]... mais je ne suis pas sur du tout..." : "Aucune suggestion"
          r += "#{c},#{s}\n"
        end
        FileTools.write(o, r)
      end

    end
  end

end
