program main
   use Map_mod(integer, real) :: SparseTable => Map, SparseTableIterator => MapIterator

   type (SparseTable), target :: my_table
   type (SparseTableIterator) :: iter

   integer, pointer :: k
   real, pointer :: v 

   call my_table%insert(1,  sqrt(2.))
   call my_table%insert(20, 3.14)
   call my_table%insert(2**14, -1.2)

   iter = my_table%begin()
   do while (iter /= my_table%end())
      k => iter%get_key()
      v => iter%get_value()
      print*,'Element:  ', k, v
      call iter%next()
   end do

end program main
