module: sieve

define constant <bit> = limited(<integer>, min: 0, max: 1);
define constant <bit-vector> = limited(<vector>, of: <bit>);

define function sieve
    (limit :: <integer>) => (number-of-primes :: <integer>, primes :: <list>)
  let prime-table = make(<bit-vector>, size: limit + 1, fill: 0);

  let primes :: <list> =
    collecting ()
      for (i from 2 to limit)
        if (prime-table[i] = 0)
          collect(i);
          for (j from i by i, while: j <= limit)
            prime-table[j] := 1;
          end for;
        end if;
      end for;
    end collecting;
  
  values(primes.size, primes)
end function sieve;

define function main (name :: <string>, arguments :: <vector>)
  if (arguments.size > 0)
    let n :: <integer> = string-to-integer(arguments[0]);
    let (number :: <integer>, primes :: <list>) = sieve(n);

    format-out(">> There are %d primes between 0 and %d.\n", number, n);
    format-out(">> Should I print them out? [y/n]\n<< ");
    force-output(*standard-output*);

    let answer :: <string> = read-line(*standard-input*);
    if (answer = "y" | answer = "yes")
      format-out(">> %=\n", primes);
    else
      format-out(">> Okay. Good bye!\n");
    end if;
  else
    format-out("usage: %s n\n", name);
  end if;
end function main;

main(application-name(), application-arguments());
