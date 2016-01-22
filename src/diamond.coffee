String::repeat = (n) -> Array(n+1).join(this)
String::until = (substring) -> this[..(substring.length + this.indexOf(substring) - 1)]
String::append = (addition) -> "#{this}#{addition}"
Array::removeLast = () -> this[...-1]

class Diamond
  ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  INVALID_INPUT = "INVALID INPUT"

  constructor: (input) ->
    @stopLetter = ensureValidInput(input)
    return unless @stopLetter

    last = ALPHABET.indexOf @stopLetter

    lines = []
    for letter in ALPHABET.until @stopLetter
      i = lines.length
      line = ' '.repeat(last - i).append(letter)
      gapSpaces = 2 * i - 1
      line = line.append(' '.repeat gapSpaces).append(letter) if gapSpaces > 0
      lines.push(line)
    @diamondLines = lines.concat lines.removeLast().reverse()

  ensureValidInput = (input) ->
    return false unless input
    return false unless typeof input == 'string'
    return false unless /^[a-zA-Z]$/.test input
    input.toUpperCase()

  toString: ->
    if @diamondLines then @diamondLines.join '\n' else INVALID_INPUT

module.exports = Diamond
