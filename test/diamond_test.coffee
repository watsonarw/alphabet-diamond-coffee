chai = require 'chai'
expect = chai.expect
Diamond = require '../src/diamond'

behavesLike = {}

behavesLike.aValidDiamond = (diamond, expectedLines) ->
  diamondString = diamond.toString()

  it "has #{expectedLines.length} lines", -> diamondString.split('\n').length == expectedLines.length
  it "is has the same lines backwards as it has forwards", ->
    diamondLines = diamondString.split('\n')
    expect(diamondLines).to.equal diamondLines.reverse()
  it 'has the correct lines', ->
    expectedString = expectedLines.join '\n'
    expect(diamondString).to.equal expectedString

behavesLike.anInvalidDiamond = (diamond) ->
  it 'is invalid', -> expect(diamond.toString()).to.equal 'INVALID INPUT'

describe 'A diamond constructed with', ->
  describe 'e', ->
    behavesLike.aValidDiamond(
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
    behavesLike.aValidDiamond(
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
    behavesLike.aValidDiamond(
      new Diamond('A'),
      [
        'A'
      ]
    )

  describe 'diamonds constructed with lowercase or uppercase letter', ->
    it 'should be the same', ->
      expect(new Diamond('l').toString()).to.equal new Diamond('L').toString()

  describe 'a number', ->
    behavesLike.anInvalidDiamond new Diamond(1)

  describe 'an array', ->
    behavesLike.anInvalidDiamond new Diamond(['E'])

  describe 'a non alphabetic string', ->
    behavesLike.anInvalidDiamond new Diamond('1')

  describe 'a non alphanumeric string', ->
    behavesLike.anInvalidDiamond new Diamond('!')

  describe 'an empty string', ->
    behavesLike.anInvalidDiamond new Diamond('')

  describe 'a string with more than one letter', ->
    behavesLike.anInvalidDiamond new Diamond('ZZ')

  describe 'a string with more than one different letter', ->
    behavesLike.anInvalidDiamond new Diamond('St')
