module Atbash
  module_function

  SOURCE_DICT = 'abcdefghijklmnopqrstuvwxyz'.freeze
  DEST_DICT = 'zyxwvutsrqponmlkjihgfedcba'.freeze

  def encode(message) = message.downcase.delete(' ,.:;').tr(SOURCE_DICT, DEST_DICT).scan(/.{1,5}/).join(' ')

  def decode(data) = data.delete(' ').tr(DEST_DICT, SOURCE_DICT)
end
