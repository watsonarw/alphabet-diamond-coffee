Diamond = require './diamond'

args = process.argv[2]
diamond = new Diamond(args);
console.log diamond.toString()
