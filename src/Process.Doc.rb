## Documentation generator
if $STAGING
  if $TEST && Dir.exist?("../doc")
    DocGenerator.markdown("../doc")
    DocGenerator.html("../doc/HTML")
    p "generate report"
    DocGenerator::Checker.run("../doc_report.csv", "../doc_generated.rb", "../ee4_report.tsv")
    p "generate JSON files"
    File.open('../doc/doc.js', 'w+'){|f| f.write(DocGenerator.to_json)}
    p "generate Self-contained RME"
    File.open('../src/package.rb', 'r') do |f|
      package = eval(f.read)

      dump = package.components.reduce("") do |acc, n|
        p "dump #{n}"
        acc + File.read("../src/#{n}") + "\n"
      end
      File.open('../RME.rb', 'w+'){|rf| rf.write(dump)}
    end
    p "done! let's go !"
  end
end
