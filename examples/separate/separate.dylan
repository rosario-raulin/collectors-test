module: separate

define function separate (collection, predicate) => (true-part, false-part)
  collecting (true-part, false-part)
      do(method (obj)
           if (predicate(obj)) collect-into(true-part, obj)
           else collect-into(false-part, obj) end if; 
         end method, collection);
      
      values(collected(true-part), collected(false-part));
  end collecting;
end function separate;

define function main (name :: <string>, arguments :: <vector>)
  if (arguments.size > 0)
    let nums = map(method (arg) string-to-integer(arg) end, arguments);
    let (even, odd) = separate(nums, even?);

    format-out("odd numbers:\t%=\n", odd);
    format-out("even numbers:\t%=\n", even);
  else
    format-out("usage: %s numbers\n", name);
  end if;
end function main;

main(application-name(), application-arguments());
