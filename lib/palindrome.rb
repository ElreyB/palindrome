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
