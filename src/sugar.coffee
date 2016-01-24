String::repeat = (n) -> Array(n+1).join(this)
String::until = (substring) -> this[..(substring.length + this.indexOf(substring) - 1)]
String::append = (addition) -> "#{this}#{addition}"
String::indent = (indentation) -> "#{' '.repeat indentation}#{this}"

Array::excludeLast = () -> this[...-1]
Array::mirror = () -> this.concat this.excludeLast().reverse()
