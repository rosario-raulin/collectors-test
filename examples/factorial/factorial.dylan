module: factorial

// ATTENTION: THIS DOES NOT COMPILE!
//
// I don't really understand why... The keyword arguments (from: and by:) cause
// trouble here though there is special macro case for keyword arguments in
// collecting(). (see sources/collections/collectors-macros.dylan)

define function factorial (n :: <integer>) => (n! :: <integer>)
  collecting (as <integer>, from: 1, by: \*)
      for (i from 2 to n) collect(i) end for;
  end collecting
end function;

define function main (name :: <string>, arguments :: <vector>)
  if (arguments.size > 0)
    format-out("%d\n", factorial(string-to-integer(arguments[0])));
  end if;
end function main;

main(application-name(), application-arguments());
