module: dylan-user

define library sieve
  use common-dylan;
  use io;
  use collections;
end library;

define module sieve
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use collectors;
  use streams;
  use standard-io;
end module;
