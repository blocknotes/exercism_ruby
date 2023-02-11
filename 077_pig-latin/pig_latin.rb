module PigLatin
  CONSONANT_SOUND = 'ch|rh|qu|sch|thr|th|[bcdfghjklmnpqrstvwxyz]'.freeze
  VOWEL_SOUND = 'xr|yt|[aeiou]'.freeze

  RULE1 = /\A(#{VOWEL_SOUND})/
  RULE2 = /\A(#{CONSONANT_SOUND})(.+)\z/
  RULE3 = /\A(#{CONSONANT_SOUND}qu)(.+)\z/
  RULE4 = /\A(#{CONSONANT_SOUND}y)(.+)\z/

  module_function

  def translate(message) = message.split(' ').map(&method(:translate_word)).join(' ')

  def translate_word(word)
    case word
    when RULE1 then "#{word}ay"
    when RULE4, RULE3, RULE2 then [Regexp.last_match(2), Regexp.last_match(1), 'ay'].join
    else word
    end
  end
end
