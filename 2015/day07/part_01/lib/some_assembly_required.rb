require "colorize"
require_relative "input"
require_relative "helper"

def run_circuit(instructions, dictionary)
  @instructions = instructions
  @dictionary = dictionary

  @instructions.each do |instruction|
    length_filter(instruction, @dictionary)
  end
  # p @dictionary
  @dictionary.select { |k, v| v != 0 }
end

@instructions_booklet_dictionary = {}

# 1. Parse instructions from input via regular expression
p @instructions_booklet = input_preparation(@instructions_booklet)
# p @instructions_booklet = @instructions_booklet.slice(0, 3)

@hash_dic = {}
@instructions_booklet.each.with_index do |set, i|
  # p set
  if set.length == 2 # ASSIGN
    # "x 123"
    output = set[0]
    a = set[1]

    @hash_dic[output] = a
  elsif set.length == 3 # NOT
    #   # puts "elsif"

    #   # "h","~", "x"
    output = set[0]
    operator = set[1]
    a = set[2]

    @hash_dic[output] = "~#{a}"
  else # set.length == 4 {& | << >> }
    # ["d", "x", "&", "y"]
    # ["e", "x", "|", "y"]
    # ["f", "x", "<<", "2"]
    # ["g", "y", ">>", "2"]
    output = set[0]
    a = set[1]
    operator = set[2]
    b_shift = set[3]

    @hash_dic[output] = "#{a}#{operator}#{b_shift}"
    #     @hash_dic[output] = eval(" #{@hash_dic[a]} #{operator} #{operator == ">>" || operator == "<<" ? b_shift.to_i : @hash_dic[b_shift]}")
  end
end

p @hash_dic

# run_circuit(@instructions_booklet, @instructions_booklet_dictionary)

# p @instructions_booklet_dictionary
# @instructions_booklet

# key_value = {}
# @instructions_booklet.each { |set|
#   key_value[set[0]] = set[1]
# }
# key_value
# key_value.count

# 2. Fill a Map with parsed wires as keys and instructions as values
#  p key_value
# => {"x"=>"123", "y"=>"456", "d"=>"x & y", "e"=>"x | y", "f"=>"x << 2", "g"=>"y >> 2", "h"=>"~ x", "i"=>"~ y"}

# 3. Recursively get values from a Map and if value is an instruction — execute it and return the result.

# key_value.each do |k, v|
#   # puts k.to_s + key_value[k].to_s
#   if v.class == String
#     p key_value[k].join
#   end
# end

{ "ls" => "lf&lq", "jn" => "iu>>1", "bv" => "bo|bu", "hc" => "gj>>1", "eu" => "et>>2", "by" => "bv&bx", "iu" => "is|it", "o" => "b|n", "gg" => "gf|ge", "ku" => "~kt", "ed" => "ea&eb", "ks" => "kl|kr", "hl" => "hi&hk", "ax" => "au&av", "lg" => "lf>>2", "df" => "dd>>3", "fc" => "eu&fa", "di" => "df&dg", "it" => "ip<<15", "em" => "~el", "ff" => "et|fe", "fn" => "fj<<15", "u" => "t|s", "ma" => "ly|lz", "kr" => "ko&kq", "fy" => "~fx", "fm" => "et>>1", "fb" => "eu|fa", "de" => "dd>>2", "gp" => "~go", "ke" => "kb&kd", "hi" => "hg|hh", "kg" => "jm<<1", "co" => "~cn", "jq" => "jp>>2", "js" => "jp>>5", "ip" => "1&io", "es" => "eo<<15", "jk" => "1&jj", "j" => "g&i", "ck" => "ci>>3", "gq" => "gn&gp", "fv" => "fs&fu", "lm" => "lj&ll", "jo" => "jk<<15", "iw" => "iu>>3", "ij" => "~ii", "cd" => "1&cc", "bp" => "bn>>3", "gx" => "~gw", "fu" => "~ft", "jp" => "jn|jo", "jc" => "iv|jb", "hw" => "hv|hu", "b" => "19138", "gm" => "gj>>5", "ht" => "hq&hs", "er" => "dy>>1", "ap" => "ao|an", "lf" => "ld|le", "ce" => "bk<<1", "cc" => "bz&cb", "bm" => "bi<<15", "io" => "il&in", "ai" => "af&ah", "bl" => "as>>1", "lh" => "lf>>3", "et" => "er|es", "ay" => "~ax", "db" => "ci>>1", "fg" => "et&fe", "ln" => "lg|lm", "n" => "k&m", "ia" => "hz>>2", "lb" => "kh<<1", "ez" => "~ey", "dj" => "~di", "eg" => "dz|ef", "a" => "lx", "ja" => "~iz", "hd" => "gz<<15", "cf" => "ce|cd", "ft" => "fq&fr", "bb" => "at&az", "hb" => "ha|gz", "fx" => "fp&fv", "gc" => "~gb", "ii" => "ia&ig", "gn" => "gl|gm", "c" => "0", "cb" => "~ca", "cg" => "bn>>1", "t" => "c<<1", "iy" => "iw|ix", "kh" => "kg|kf", "ek" => "dy|ej", "kp" => "km&kn", "fd" => "~fc", "ib" => "hz>>3", "dr" => "~dq", "fh" => "~fg", "dz" => "dy>>2", "kl" => "kk>>2", "fj" => "1&fi", "hs" => "~hr", "ki" => "jp>>1", "bn" => "bl|bm", "gz" => "1&gy", "gu" => "gr&gt", "dd" => "db|dc", "dl" => "de|dk", "av" => "as>>5", "li" => "lf>>5", "hp" => "hm&ho", "ci" => "cg|ch", "gw" => "gj&gu", "gi" => "ge<<15", "g" => "e|f", "fw" => "fp|fv", "fe" => "fb&fd", "ch" => "cd<<15", "v" => "b>>1", "ba" => "at|az", "bo" => "bn>>2", "lk" => "lh&li", "do" => "dl&dn", "ej" => "eg&ei", "fa" => "ex&ez", "kq" => "~kp", "ll" => "~lk", "ak" => "x&ai", "kb" => "jp|ka", "je" => "~jd", "jb" => "iy&ja", "jr" => "jp>>3", "ga" => "fo|fz", "dh" => "df|dg", "gk" => "gj>>2", "gv" => "gj|gu", "ji" => "~jh", "bj" => "ap<<1", "lt" => "~ls", "jl" => "ir<<1", "ca" => "bn&by", "lz" => "lv<<15", "bd" => "ba&bc", "dc" => "cy<<15", "lq" => "ln&lp", "aq" => "x>>1", "gr" => "gk|gq", "ky" => "~kx", "jj" => "jg&ji", "bz" => "bn|by", "gf" => "fl<<1", "br" => "bp|bq", "hq" => "he|hp", "ew" => "et>>5", "iv" => "iu>>2", "go" => "gl&gm", "aj" => "x|ai", "he" => "hc|hd", "lo" => "lg&lm", "lj" => "lh|li", "du" => "da<<1", "fp" => "fo>>2", "gs" => "gk&gq", "bk" => "bj|bi", "lr" => "lf|lq", "cr" => "cj&cp", "hy" => "hu<<15", "bi" => "1&bh", "fq" => "fo>>3", "lp" => "~lo", "iq" => "hw<<1", "dw" => "dd>>1", "dx" => "dt<<15", "el" => "dy&ej", "ar" => "an<<15", "as" => "aq|ar", "s" => "1&r", "fz" => "fw&fy", "in" => "~im", "ev" => "et>>3", "dt" => "1&ds", "ef" => "ec&ee", "al" => "~ak", "jm" => "jl|jk", "eo" => "1&en", "lc" => "lb|la", "jh" => "iu&jf", "ix" => "iu>>5", "bw" => "bo&bu", "da" => "cz|cy", "jd" => "iv&jb", "iz" => "iw&ix", "ly" => "lf>>1", "jg" => "iu|jf", "dn" => "~dm", "lx" => "lw|lv", "ha" => "gg<<1", "lu" => "lr&lt", "fo" => "fm|fn", "hg" => "he>>3", "am" => "aj&al", "la" => "1&kz", "eb" => "dy>>5", "jf" => "jc&je", "cp" => "cm&co", "gy" => "gv&gx", "ex" => "ev|ew", "kc" => "jp&ka", "fl" => "fk|fj", "ea" => "dy>>3", "bt" => "~bs", "ah" => "~ag", "eh" => "dz&ef", "cz" => "cf<<1", "cw" => "~cv", "cy" => "1&cx", "dm" => "de&dk", "cn" => "ck&cl", "aa" => "x>>5", "ep" => "dv<<1", "hf" => "he>>2", "bx" => "~bw", "cm" => "ck|cl", "bs" => "bp&bq", "be" => "as|bd", "hr" => "he&hp", "ey" => "ev&ew", "lv" => "1&lu", "km" => "kk>>3", "p" => "b&n", "kd" => "~kc", "lw" => "lc<<1", "ko" => "km|kn", "ig" => "id&if", "ik" => "ih&ij", "ju" => "jr&js", "cl" => "ci>>5", "is" => "hz>>1", "kf" => "1&ke", "gt" => "~gs", "az" => "aw&ay", "y" => "x>>2", "ae" => "ab&ad", "fi" => "ff&fh", "cv" => "ci&ct", "fk" => "eq<<1", "gl" => "gj>>3", "ao" => "u<<1", "bc" => "~bb", "hk" => "~hj", "kz" => "kw&ky", "bf" => "as&bd", "dy" => "dw|dx", "bu" => "br&bt", "kx" => "kk&kv", "eq" => "ep|eo", "hx" => "he>>1", "kk" => "ki|kj", "jv" => "~ju", "en" => "ek&em", "kn" => "kk>>5", "ei" => "~eh", "hz" => "hx|hy", "ec" => "ea|eb", "w" => "s<<15", "gh" => "fo>>1", "kw" => "kk|kv", "bq" => "bn>>5", "ee" => "~ed", "hu" => "1&ht", "cx" => "cu&cw", "f" => "b>>5", "kt" => "kl&kr", "ir" => "iq|ip", "cj" => "ci>>2", "cq" => "cj|cp", "r" => "o&q", "dg" => "dd>>5", "d" => "b>>2", "kv" => "ks&ku", "e" => "b>>3", "k" => "d|j", "q" => "~p", "cs" => "~cr", "dv" => "du|dt", "kj" => "kf<<15", "ad" => "~ac", "fr" => "fo>>5", "il" => "hz|ik", "ka" => "jx&jz", "gj" => "gh|gi", "ld" => "kk>>1", "ic" => "hz>>5", "at" => "as>>2", "jz" => "~jy", "an" => "1&am", "cu" => "ci|ct", "hj" => "hg&hh", "jx" => "jq|jw", "x" => "v|w", "le" => "la<<15", "dk" => "dh&dj", "ds" => "dp&dr", "jy" => "jq&jw", "aw" => "au|av", "bg" => "~bf", "ab" => "z|aa", "gd" => "ga&gc", "im" => "hz&ik", "jw" => "jt&jv", "ac" => "z&aa", "jt" => "jr|js", "hv" => "hb<<1", "hm" => "hf|hl", "id" => "ib|ic", "fs" => "fq|fr", "ct" => "cq&cs", "ih" => "ia|ig", "dp" => "dd|do", "l" => "d&j", "ie" => "ib&ic", "au" => "as>>3", "bh" => "be&bg", "dq" => "dd&do", "m" => "~l", "ge" => "1&gd", "ag" => "y&ae", "gb" => "fo&fz", "if" => "~ie", "h" => "e&f", "z" => "x>>3", "af" => "y|ae", "hn" => "hf&hl", "i" => "~h", "ho" => "~hn", "hh" => "he>>5" }
