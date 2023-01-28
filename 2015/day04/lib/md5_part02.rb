require "digest"
require "colorize"

def md5_to_match(secret_key)
  secret_key_lenght = secret_key.split("").count

  string = []
  secret_key_lenght.times do
    string << "9"
  end
  upper_limit = string.join.to_i

  (0..upper_limit).to_a.map! do |element|
    # p element
    md5 = Digest::MD5.hexdigest "#{secret_key}#{element}"
    @element = element
    if md5.match?(/^0{6,}/)
      # puts "#{secret_key}#{@element} => #{md5}".green
      break
    end
  end
  @element.to_s
end

puts "The lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash (SIX ZEROS) for 'bgvyzdsv' is => " + md5_to_match("bgvyzdsv")
