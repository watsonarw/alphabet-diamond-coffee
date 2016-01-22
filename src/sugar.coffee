String::repeat = (n) -> Array(n+1).join(this)
String::until = (substring) -> this[..(substring.length + this.indexOf(substring) - 1)]
String::append = (addition) -> "#{this}#{addition}"

Array::excludeLast = () -> this[...-1]
