module Map_mod(key_type, value_type)
   use Pair_mod(key_type, value_type)
   use Set_mod(Pair)
   type :: key_type
   type :: value_type
   private

   public :: Map
   public :: Pair
   
   type :: Map
      private
      type (Set) :: tree
   contains
      procedure :: insert_pair
      procedure :: insert_key_value
      procedure :: size
   end type Map

   
   type :: MapIterator
      private
      class (Map), pointer :: reference => null()
      class (SetIterator) :: set_iterator
   contains
      procedure :: get_key()
      procedure :: get_value()
      procedure :: get_pair()
   end type MapIterator

   

contains

   integer function size(this)
      class (Map), intent(in) :: this
      size = this%tree%size()
   end function size


   subroutine insert_pair(this, p)
      class (Map), intent(inout) :: this
      type (Pair), intent(in) :: p
      ...
   end subroutine insert_pair
   

   subroutine insert_key_value(this, key, value)
      class (Map), intent(inout) :: this
      type (key_type), intent(in) :: key
      type (value_type), intent(in) :: value
      
      call this%insert(Pair(key, value)

   end subroutine insert_key_value

   
end module Map_mod
