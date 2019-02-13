module Pair_mod

   DEFINE MACRO :: PAIR(key_type, value_type, container_type)
   type :: container_type
      type (key_type) :: key
      type (value_type) :: value
   end type container_type
   END MACRO

end module Pair_mod


