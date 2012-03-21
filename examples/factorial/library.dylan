module: dylan-user

define library factorial
  use common-dylan;
  use io;
  use collections;
end library;

define module factorial
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use collectors;
end module;
