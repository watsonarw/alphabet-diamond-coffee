Diamond = require './diamond'

inputLetter = process.argv[2]
diamond = new Diamond inputLetter
console.log diamond.toString()
