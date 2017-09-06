class Palindrome

  def self.palindrome?(characters)
    internal_palindrome?(characters.downcase)
  end

  def self.internal_palindrome?(characters)
    if characters.length() < 2
      return true
    elsif characters[0] != characters[-1]
      return false
    else
      return Palindrome.palindrome?(characters.slice(1, characters.length-2))
    end
  end
end


palindromes = []
File.open("#{File.dirname(__FILE__)}/../test.txt", 'r') do |file|
  file_line = file.gets.split(" ")
  file_line.each do |word|
    unless (("a".."z").cover?(word[-1])) || (("A".."Z").cover?(word[-1])) || (("0".."9").cover?(word[-1]))
      word = word.slice(0, word.length-1)
    end
    if Palindrome.palindrome?(word)
      palindromes.push(word)
    end
  end
end
puts palindromes.to_s
puts "There are #{palindromes.length} palindromes found in the file."
