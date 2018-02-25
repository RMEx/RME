## Documentation generator
if $STAGING
  if $TEST #&& Dir.exist?("../doc")
    #DocGenerator.markdown("../doc")
    #DocGenerator.html("../doc/HTML")
    puts "generate ../doc_report.csv"
    DocGenerator::Checker.run("../doc_report.csv", "../doc_generated.rb", "../ee4_report.tsv")
    File.open('../doc.js', 'w+'){|f| f.write(DocGenerator.to_json)}
    puts "generate ../doc.js"
    puts "generate ../RME.rb (v#{RME.version.to_s})"
    File.open('../src/package.rb', 'r') do |f|
      package = eval(f.read)
      dump = package.components.reduce("") do |acc, n|
        #puts "dump #{n}"
        acc + File.read("../src/#{n}") + "\n"
      end
      dump = dump.split("\n")
      dump[dump.index("# ** RME")] = "# ** RME v" + RME.version.to_s
      dump = dump.join("\n")
      File.open('../RME.rb', 'w+'){|rf| rf.write(dump)}
    end
    puts "done! let's go !"
  end
end
