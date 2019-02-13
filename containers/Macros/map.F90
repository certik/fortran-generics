module Map_mod
   use Pair_mod
   use Set_mod
   implicit none
   private

   PUBLIC :: MAP
   PUBLIC :: MAP_DECL
   PUBLIC :: MAP_IMPL

   DEFINE MACRO :: MANGLE(name) name %% _map
   
   DEFINE MACRO :: MAP(key_type, value_type, container_type, iterator_type)
      EXPAND MAP_DECL(key_type, value_type, container_type, iterator_type)
      contains
      EXPAND MAP_IMPL(key_type, value_type, container_type, iterator_type)
   END MACRO


   DEFINE MACRO :: MAP_DECL(key_type, value_type, container_type, iterator_type)
      EXPAND PAIR(key_type, value_type, pair %% container_type)
      EXPAND SET_DECL(pair %% container_type, set %% container_type, set %% iterator_type)

      type :: map
         private
         type (set %% container_type) :: tree
      contains
         procedure :: insert => EXPAND MANGLE(insert)
         procedure :: size => EXPAND MANGLE(size)
      end type map

   END MACRO

   DEFINE MACRO :: MAP_IMPL(key_type, value_type, container_type, iterator_type)
      EXPAND SET_IMPL(pair %% container_type, set %% container_type, set %% iterator_type)

      integer function EXPAND MANGLE(size)(this)
         class (container_type), intent(in) :: this
         size = this%tree%size()
      end function size

      ...

   END MACRO

   

end module Map_mod
