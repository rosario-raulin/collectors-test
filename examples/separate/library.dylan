module: dylan-user

define library separate
  use common-dylan;
  use io;
  use collections;
end library;

define module separate
  use common-dylan, exclude: { format-to-string };
  use format-out;
  use collectors;
end module;
