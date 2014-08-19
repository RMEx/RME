#==============================================================================
# ** RME V1.0.0 Compiler
#------------------------------------------------------------------------------
#  With : 
# Nuki
#------------------------------------------------------------------------------
# An RPGMaker's Compiler
#==============================================================================

# PREMICE

COMPILERINFO = '../CompilerInfo.rb'
EMPTY = "x\x9C\u{3 0 0 0 0 1}"
mlib = File.open(COMPILERINFO, 'rb') { |f| f.read }
eval(mlib)

# Build Script tree
script_tree = load_data(PATHS[:raw_compiled])
max_id = script_tree.max_by{|s| s[0]}[0]
over_id = script_tree.index{|s| s[1] == PATHS[:after]}
before = script_tree[0 .. over_id]
after = script_tree[over_id.succ .. -1]
content = [[max_id, "", EMPTY]]
LIB.each do |name, filename|
  max_id += 1 
  fname = PATHS[:src] + filename
  content_script = File.open(fname, 'rb') { |f| f.read }
  deflator = Zlib::Deflate.new(Zlib::BEST_COMPRESSION)
  data_script = deflator.deflate(content_script, Zlib::FINISH)
  deflator.close
  content << [max_id, name, data_script]
end
# Compile tree
new_tree = before + content + after
odir = PATHS[:output_dir]
ofile = odir + PATHS[:output_file]
oback = odir + PATHS[:output_backup]
save_data(load_data(ofile), oback)
p "Backup savec in #{oback}"
save_data(new_tree, ofile)
p "Rvata save in #{ofile}"
gitted = "#{PATHS[:versionning]}VERSION-#{Time.now.to_i}_#{PATHS[:output_file]}"
save_data(new_tree, gitted)
p "RME Compiled !"
msgbox("Comilation successed!")