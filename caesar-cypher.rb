## Constants
UPCASE_UPPER = 90
UPCASE_LOWER = 65
LOCASE_UPPER = 122
LOCASE_LOWER = 97
## Function Caesar Cypher, returns string
def caesar_cypher(string, shift)
  # Makes sure that the function can handle -26 > shift > 26
  shift = shift % 26
  shifted = 0
  new_string = []
  # Iterate over each character of a string
  string.each_char do |char|
    # If character is alpha, lowercase
    if (c = char.ord).between?(LOCASE_LOWER, LOCASE_UPPER)
      difference = 0
      # If character + number of shift will overflow upper
      if c + shift > LOCASE_UPPER
        # Compute for the difference
        difference = (c + shift) - LOCASE_UPPER
        shifted = (LOCASE_LOWER - 1) + difference
      # Similar to if, but if character + number will overflow lower (negative shift)
      elsif (c + shift) < LOCASE_LOWER
        difference = (c + shift) - LOCASE_LOWER
        shifted = (LOCASE_UPPER + 1) + difference
      # Else no overflow
      else
        shifted = c + shift
      end
      new_string.push(shifted.chr)
    elsif (c = char.ord).between?(UPCASE_LOWER, UPCASE_UPPER)
      if c + shift > UPCASE_UPPER
        difference = (c + shift) - UPCASE_UPPER
        shifted = (UPCASE_LOWER - 1) + difference
      elsif (c + shift) < UPCASE_LOWER
        difference = (c + shift) - UPCASE_LOWER
        shifted = (UPCASE_UPPER + 1) + difference
      else
        shifted = c + shift
      end
      new_string.push(shifted.chr)
    else
      new_string.push(char)
    end
  end
  new_string.join
end

puts caesar_cypher('abcxyz!', 1) # "bcdyxa"
puts caesar_cypher('abcxyz?', -1) # "zabwxy"
puts caesar_cypher('abcxyz', -26) # "abcxyz"
puts caesar_cypher('abcxyz', 26) # "abcxyz"
puts caesar_cypher('abcxyz', 53) # "bcdyza"
