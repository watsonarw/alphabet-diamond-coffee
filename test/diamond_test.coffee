chai = require 'chai'
expect = chai.expect
Diamond = require '../src/diamond'

behavesLikeAValidDiamond = (diamond, expectedLines) ->
  diamondString = diamond.toString()

  it "has #{expectedLines.length} lines", -> diamondString.split('\n').length == expectedLines.length
  it 'has the correct lines', ->
    expectedString = expectedLines.join '\n'
    expect(diamondString).to.equal expectedString

behavesLikeAnInvalidDiamond = (diamond) ->
  it 'is invalid', -> expect(diamond.toString()).to.equal 'INVALID INPUT'

describe 'A diamond constructed with', ->
  describe 'e', ->
    behavesLikeAValidDiamond(
      new Diamond('e'),
      [
        '    A'
        '   B B'
        '  C   C'
        ' D     D'
        'E       E'
        ' D     D'
        '  C   C'
        '   B B'
        '    A'
      ]
    )

  describe 'D', ->
    behavesLikeAValidDiamond(
      new Diamond('D'),
      [
        '   A'
        '  B B'
        ' C   C'
        'D     D'
        ' C   C'
        '  B B'
        '   A'
      ]
    )
  describe 'A', ->
    behavesLikeAValidDiamond(
      new Diamond('A'),
      [
        'A'
      ]
    )

  describe 'a number', ->
    behavesLikeAnInvalidDiamond new Diamond(1)

  describe 'an array', ->
    behavesLikeAnInvalidDiamond new Diamond(['E'])

  describe 'a non alphabetic string', ->
    behavesLikeAnInvalidDiamond new Diamond('1')

  describe 'a non alphanumeric string', ->
    behavesLikeAnInvalidDiamond new Diamond('!')

  describe 'an empty string', ->
    behavesLikeAnInvalidDiamond new Diamond('')

  describe 'a string with more than one letter', ->
    behavesLikeAnInvalidDiamond new Diamond('ZZ')

  describe 'a string with more than one different letter', ->
    behavesLikeAnInvalidDiamond new Diamond('St')
