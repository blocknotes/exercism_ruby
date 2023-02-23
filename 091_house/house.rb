module House
  FIRST_SENTENCE = 'This is the house that Jack built.'.freeze
  SENTENCES = [
    'that lay in the house that Jack built.',
    'that ate the malt',
    'that killed the rat',
    'that worried the cat',
    'that tossed the dog',
    'that milked the cow with the crumpled horn',
    'that kissed the maiden all forlorn',
    'that married the man all tattered and torn',
    'that woke the priest all shaven and shorn',
    'that kept the rooster that crowed in the morn',
    'that belonged to the farmer sowing his corn',
    'this is the horse and the hound and the horn'
  ].freeze
  SUBJECT = 'This is the %s'.freeze

  def recite
    result = "#{FIRST_SENTENCE}\n\n"
    sentences = (1...SENTENCES.size).map do |i|
      subject = SENTENCES[i].sub(/(.+?)the /, '')
      [format(SUBJECT, subject), SENTENCES[0...i].reverse, ''].join("\n")
    end
    result << sentences.join("\n")
  end

  module_function :recite
end
