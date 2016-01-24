require './sugar'

class Diamond
  ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  INVALID_INPUT = "INVALID INPUT"

  constructor: (input) ->
    stopLetter = ensureValidInput(input)
    return unless stopLetter
    @diamondLines = createLines(stopLetter)

  createLines = (stopLetter) ->
    pivotLineNumber = ALPHABET.indexOf stopLetter

    lines = []
    letters = ALPHABET.until stopLetter
    for letter in letters
      currentLineNumber = lines.length
      line = lineFor letter, currentLineNumber, pivotLineNumber
      lines.push line

    lines.mirror()

  lineFor = (letter, currentLineNumber, pivotLineNumber) ->
    gap = ' '.repeat(gapLengthFor currentLineNumber )
    line = "#{letter}#{if gap then gap + letter else ''}"
    line.indent(pivotLineNumber - currentLineNumber)

  gapLengthFor = (lineNumber) ->
    2 * lineNumber - 1

  ensureValidInput = (input) ->
    return false unless input
    return false unless typeof input == 'string'
    return false unless /^[a-zA-Z]$/.test input
    input.toUpperCase()

  toString: ->
    if @diamondLines then @diamondLines.join '\n' else INVALID_INPUT

module.exports = Diamond
