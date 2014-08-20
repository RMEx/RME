# -*- coding: utf-8 -*-
#==============================================================================
# ** RME V1.0.0 DocGenerator
#------------------------------------------------------------------------------
# With: 
#  Nuki
#  Grim
# 
#==============================================================================

#==============================================================================
# ** Doc Generator
#------------------------------------------------------------------------------
#  Make the documentation of RME
#==============================================================================

module DocGenerator

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
    def blockquote(s); "> #{s}"+np; end
    def link(text, url); "[#{text}](#{url})"; end
    def line; "- - -"; end

    #--------------------------------------------------------------------------
    # * Data Navigation
    #--------------------------------------------------------------------------
    def index; "README"; end
    def cmdindex; "__command_list"; end
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
    def np; "<br />"; end
    def title(size, value); ("<h#{size}>") + value.to_s + "</h#{size}>\n"; end
    def strong(value); "<strong>#{value}</strong>"; end
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
    def cmdindex; "__command_list"; end
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
      t = mdl.title(1, RME::Doc.header[:title])
      d = RME::Doc.header[:desc] + mdl.np
      l = mdl.strong "Classes et modules"
      h + t + d + l + mdl.np
    end

    #--------------------------------------------------------------------------
    # * Create Front page (CMD)
    #--------------------------------------------------------------------------
    def make_cmd_title(mdl)
      mdl.strong "Index des commandes"
    end

    #--------------------------------------------------------------------------
    # * Create class page (header)
    #--------------------------------------------------------------------------
    def make_class_header(mdl, classname)
      h = mdl.header(classname.to_s)
      t = mdl.title(1, classname)
      a = mdl.link("Retourner à l'index", index(mdl)) + mdl.np
      d = RME::Doc.schema[classname][:description] + mdl.np
      h + t + a + d
    end

    #--------------------------------------------------------------------------
    # * Create Command page (header)
    #--------------------------------------------------------------------------
    def make_cmd_header(mdl, classname)
      h = mdl.header(classname.to_s)
      t = mdl.title(1, RME::Doc.commands[classname][:name])
      a = mdl.link("Retourner à l'index", cmdindex(mdl)) + mdl.np
      d = RME::Doc.commands[classname][:desc] + mdl.np
      h + t + a + d
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
    def make_class_methods(mdl, c, title_i =  "Liste des méthodes", proc = IDENTITY, snip = true)
      k = Hash[c.sort]
      if k.length > 0 
        t = mdl.title 2, title_i
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
          name = proc.call(name) || name
          atr_list += mdl.end_table
          inline_args = inline_args[0...-2]
          inline_args = (atr.length == 0 ? "" : "(#{inline_args})")
          t += mdl.strong("#{name}#{inline_args}")
          snippet = ""
          snippet = mdl.np + make_class_snippet(mdl, c[name]) + mdl.np if snip
          t += mdl.np + mdl.blockquote(desc) + mdl.nl + mdl.blockquote(atr_list) + snippet
        end
        return t
      end
      return ""
    end

    #--------------------------------------------------------------------------
    # * Create Commands list
    #--------------------------------------------------------------------------
    def make_cmd_methods(mdl, classname)
      kname = lambda{|x| (x =~ /.+\.(.+)/) && $1}
      make_class_methods(mdl, classname, "Liste des commandes", kname, false)
    end

    #--------------------------------------------------------------------------
    # * Create Snippets
    #--------------------------------------------------------------------------
    def make_class_snippet(mdl, c)
      if c[:snippet]
        t = "Exemple" + mdl.nl
        t += mdl.code("ruby", c[:snippet]) + mdl.np
        return t
      end
      ""
    end

    #--------------------------------------------------------------------------
    # * Create class page
    #--------------------------------------------------------------------------
    def make_class_page(mdl, klass, indexl, output)
      name = filename(mdl, klass)
      indexl += mdl.li(mdl.link(klass, name))
      page = make_class_header(mdl, klass)
      page += make_class_attributes(mdl, klass)
      page += make_class_methods(mdl, RME::Doc.schema[klass][:methods])
      page += mdl.footer
      File.open("#{output}/#{name}", 'w') do |f|
        f.write(page)
      end
      p "#{name} created!"
      return indexl
    end

    #--------------------------------------------------------------------------
    # * Create command page
    #--------------------------------------------------------------------------
    def make_command_page(mdl, c, command, indexc, output)
      fname = filename(mdl, "command_#{c}")
      indexc += mdl.li(mdl.link(command[:name], fname))
      page = make_cmd_header(mdl, c)
      page += make_cmd_methods(mdl, RME::Doc.commands[c][:commands])
      page += mdl.footer
      File.open("#{output}/#{fname}", 'w') do |f|
        f.write(page)
      end
      p "#{fname} created!"
      return indexc
    end

    #--------------------------------------------------------------------------
    # * Create documentation
    #--------------------------------------------------------------------------
    def make(mdl, output)
      indexl = make_header(mdl) + mdl.ul
      Hash[RME::Doc.schema.sort].each do |klass, i|
        indexl = make_class_page(mdl, klass, indexl, output)
      end
      indexl = indexl + mdl.end_ul + mdl.np
      indexc = make_cmd_title(mdl) + mdl.np + mdl.ul
      Hash[RME::Doc.commands.sort].each do |c, command|
        indexc = make_command_page(mdl, c, command, indexc, output)
      end
      indexc += mdl.footer
      indexl += indexc
      indexc = mdl.header("") + indexc + mdl.footer
      File.open(output + "/" + cmdindex(mdl), 'w'){|f| f.write(indexc)}
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
    #--------------------------------------------------------------------------
    # *  Render Doc in HTML
    #--------------------------------------------------------------------------
    def html(output)
      Do.make(HTML, output)
    end

  end

end
