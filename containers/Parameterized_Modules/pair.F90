module Pair_mod(key_type, value_type)
   type :: key_type
   type :: value_type
   private

   public :: pair

   type :: pair
      type (key_type) :: key_type
      type (value_type) :: value_type
   end type pair

end module Pair_mod
