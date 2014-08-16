#==============================================================================
# ** RME V1.0.0 DocGenerator
#------------------------------------------------------------------------------
#  With : 
# Nuki
# 
#==============================================================================

#==============================================================================
# ** Doc Generator
#------------------------------------------------------------------------------
#  Make documentation of RME
#==============================================================================

module DocGenerator

  #==============================================================================
  # ** Doc Generator in Markdown
  #------------------------------------------------------------------------------
  #  Make documentation of RME
  #==============================================================================

  module Markdown
    #--------------------------------------------------------------------------
    # * Singleton
    #--------------------------------------------------------------------------
    extend self

    #--------------------------------------------------------------------------
    # * Markdown balise
    #--------------------------------------------------------------------------
    def nl; "  \n"; end
    def np; "\n"*2; end
    def title(size, value); ("#"*size) + value.to_s + "\n"; end
    def strong(value); "**#{value}**"; end
    def italic(value); "*#{value}*"; end 
    def ul; ""; end
    def end_ul; ""; end
    def li(item); "*    #{item}"+"\n"; end
    def enum(t, v); li("**#{t}** : #{v}"); end
    def code(lang, snippet); "```#{lang}"+nl+snippet+nl+"```"; end
    def inline_code(c); "`#{c}`"; end
    def table(*titles)
      titles.join("|") + nl + (["---"] * titles.length).join(" | ") + nl
    end
    def tr(*values); values.join("|") + nl; end
    def end_table; ""; end
    def blockquote(s); "> #{s}"+nl; end
    def link(text, url); "[#{text}](#{url})"; end
    def line; "- - -"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "README"; end
    def extension; "md"; end
  end

  #==============================================================================
  # ** Do
  #------------------------------------------------------------------------------
  #  Make documentation of RME
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
    # * File name
    #--------------------------------------------------------------------------
    def filename(mdl, classname)
      classname.to_s.gsub(":", "_").gsub(".", "_") + "." + mdl.extension
    end

    #--------------------------------------------------------------------------
    # * Create Front page (header)
    #--------------------------------------------------------------------------
    def make_header(mdl)
      t = mdl.title(1, RME::Doc.header[:title])
      d = RME::Doc.header[:desc] + mdl.np
      l = mdl.strong "Classes et modules"
      t + d + l + mdl.np
    end

    #--------------------------------------------------------------------------
    # * Create Front page (CMD)
    #--------------------------------------------------------------------------
    def make_cmd_title(mdl)
      mdl.strong "Index des commandes"
    end

    #--------------------------------------------------------------------------
    # * Create classe page (header)
    #--------------------------------------------------------------------------
    def make_class_header(mdl, classname)
      t = mdl.title(1, classname)
      a = mdl.link("Retourner à l'index", index(mdl)) + mdl.np
      d = RME::Doc.schema[classname][:description] + mdl.np
      t + a + d
    end

    #--------------------------------------------------------------------------
    # * Create Command page (header)
    #--------------------------------------------------------------------------
    def make_cmd_header(mdl, classname)
      t = mdl.title(1, RME::Doc.commands[classname][:name])
      a = mdl.link("Retourner à l'index", index(mdl)) + mdl.np
      d = RME::Doc.commands[classname][:desc] + mdl.np
      t + a + d
    end

    #--------------------------------------------------------------------------
    # * Create attribute list
    #--------------------------------------------------------------------------
    def make_class_attributes(mdl, classname)
      k = RME::Doc.schema[classname][:attributes]
      if k.length > 0 
        t = mdl.title 2, "Attributs"
        t += mdl.table("Nom", "Description")
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
    def make_class_methods(mdl, classname)
      k = Hash[RME::Doc.schema[classname][:methods].sort]
      if k.length > 0 
        t = mdl.title 2, "Méthodes"
        k.each do |name, data|
          desc = data[:description]
          atr = data[:attributes]
          ret = data[:returned]
          inline_args = ""
          atr_list = ""
          atr_list = mdl.table("Nom", "Type", "Description") if atr.length > 0
          atr.each do |name, dt|
            inline_args += mdl.inline_code(name.to_s) + ", "
            atr_list += mdl.tr(mdl.inline_code(name.to_s), mdl.inline_code(dt[1]), dt[0])
          end
          atr_list += mdl.end_table
          inline_args = inline_args[0...-2]
          inline_args = (atr.length == 0 ? "" : "(#{inline_args})")
          t += mdl.strong("#{name}#{inline_args}")
          snippet = mdl.np + make_class_snippet(mdl, name, classname) + mdl.np
          t += mdl.np + mdl.blockquote(desc) + mdl.nl + mdl.blockquote(atr_list) + snippet
        end
        return t
      end
      return ""
    end

    #--------------------------------------------------------------------------
    # * Create Snippter
    #--------------------------------------------------------------------------
    def make_class_snippet(mdl, meth, classname)
      if RME::Doc.schema[classname][:methods][meth][:snippet]
        t = "Exemple" + mdl.nl
        t += mdl.code("ruby", RME::Doc.schema[classname][:methods][meth][:snippet]) + mdl.np
        return t
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create documentation
    #--------------------------------------------------------------------------
    def make(mdl, output)
      #File.open(local_filename, 'w') {|f| f.write(doc) }
      indexl = make_header(mdl) + mdl.ul
      Hash[RME::Doc.schema.sort].each do |klass, i|
        name = filename(mdl, klass)
        indexl += mdl.li(mdl.link(klass, name))
        page = make_class_header(mdl, klass)
        page += make_class_attributes(mdl, klass)
        page += make_class_methods(mdl, klass)
        File.open("#{output}/#{name}", 'w') do |f|
          f.write(page)
        end
        p "#{name} created!"
      end
      indexl = indexl + mdl.end_ul + mdl.np + make_cmd_title(mdl) + mdl.np + mdl.ul
      Hash[RME::Doc.commands.sort].each do |c, command|
        fname = filename(mdl, "command_#{c}")
        indexl += mdl.li(mdl.link(command[:name], fname))
        page = make_cmd_header(mdl, c)
        File.open("#{output}/#{fname}", 'w') do |f|
          f.write(page)
        end
        p "#{fname} created!"
      end
      File.open(output + "/" + index(mdl), 'w'){|f| f.write(indexl)}
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

  end

end