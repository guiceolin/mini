class Bijective
  ALPHABET =
    "LdszmIQKxYeuA985wZj2Vty3EaCbWTpo7RqDOX0HSJM1Nfr64kPghnUFGvBilc".split(//)
  # make your own alphabet using:
  # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

  def self.encode(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.decode(s)
    # based on base2dec() in Tcl translation
    # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
