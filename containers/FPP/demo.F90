module SparseTable_mod
   implicit none
   private
   
#define _container_type  SparseTable
#define _iterator_type  SparseTableIterator
#define _key_type integer
#define _value_type real
#define _pair_type Pair

#include "map.inc"

#undef _container_type
#undef _iterator_type
#undef _pair_type
#undef _value_type
#undef _key_type

end module SparseTable_mod

program main
   use SparseTable_mod

   type (SparseTable), target :: my_table
   type (SparseTableIterator) :: iter

   integer, pointer :: k
   real, pointer :: v 

   ! Add 3 entries to the sparse table
   call my_table%insert(1,  sqrt(2.))
   call my_table%insert(20, 3.14)
   call my_table%insert(2**14, -1.2)

   ! Loop over the table and list the entries
   iter = my_table%begin()
   do while (iter /= my_table%end())
      k => iter%get_key()
      v => iter%get_value()
      print*,'Element:  ', k, v
      call iter%next()
   end do

end program main
