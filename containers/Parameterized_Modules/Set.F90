module Set_mod(type)
   use Vector_mod(integer) :: iVector => Vector
   use Vector_mod(type) :: tVector => Vector
   type :: type
   private

   public :: Set
   public :: SetIterator
   
   type :: Set
      private
      type (tVector) :: items
      type (iVector) :: parents
      type (iVector) :: lefts
      type (iVector) :: rights
      type (iVector) :: heights
      
      integer :: root = -1
      integer :: tsize = 0
      integer :: next_free = 0
   contains
      procedure :: size
      procedure :: insert
      procedure :: find
      procedure :: begin
      procedure :: end
   end type Set


   type :: SetIterator
      class (Set), pointer :: reference
      integer :: current = -1
   contains
      procedure :: get
      procedure :: set
   end type SetIterator


contains


   integer function size(this)
      size = this%tsize
   end function size

   subroutine insert(this, value)
      class (Set), intent(inout) :: this
      type (type), intent(in) :: value
      ...
   end subroutine insert

   function find(this, value)
   end subroutine insert

   function begin(this)
   end function begin

   function end(this)
   end function end


   ! Iterator methods

   function get(this)
   end function get

   subroutine next(this)
   end subroutine next

end module Set_mod
