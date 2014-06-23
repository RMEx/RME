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
    def link(text, url); "[#{text}](#{url})"; end

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
      t + d + l
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
    # * Create attribute list
    #--------------------------------------------------------------------------
    def make_class_attributes(mdl, classname)
      k = RME::Doc.schema[classname][:attributes]
      if k.length > 0 
        t = mdl.title 2, "Attributs"
        t += mdl.ul
        k.each do |atr, desc|
          t += mdl.enum(atr, desc)
        end
        return t + mdl.end_ul
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create Method list
    #--------------------------------------------------------------------------
    def make_class_methods(mdl, classname)
      k = RME::Doc.schema[classname][:methods]
      if k.length > 0 
        t = mdl.title 2, "Méthodes"
        k.each do |name, data|
          desc = data[:description]
          atr = data[:attributes]
          ret = data[:returned]
          inline_args = ""
          atr_list = mdl.ul
          atr.each do |name, dt|
            inline_args += name.to_s + ", "
            atr_list += mdl.enum(name.to_s + "(#{dt[1]})", dt[0])
          end
          atr_list += mdl.end_ul
          inline_args = inline_args[0...-2]
          return t + mdl.strong("#{name}(#{inline_args})") + atr_list + mdl.np
        end
      end
      return ""
    end

    #--------------------------------------------------------------------------
    # * Create documentation
    #--------------------------------------------------------------------------
    def make(mdl, output)
      #File.open(local_filename, 'w') {|f| f.write(doc) }
      indexl = make_header(mdl) + mdl.ul
      RME::Doc.schema.each do |klass, i|
        name = filename(mdl, klass)
        indexl += mdl.li(mdl.link(klass, name))
        page = make_class_header(mdl, klass)
        page += make_class_attributes(mdl, klass)
        page += make_class_methods(mdl, klass)
        File.open("#{output}/#{name}", 'w') do |f|
          f.write(page)
        end
        p "#{name} : Writted !"
      end
      indexl += mdl.end_ul
      File.open(index(mdl), 'w'){|f| f.write(indexl)}
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