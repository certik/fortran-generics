module Vector_mod(type)
   type :: type
   private

   public :: Vector
   public :: VectorIterator

   type :: Vector
      private
      type (type), allocatable :: type
   contains
      procedure :: size
      procedure :: at
      procedure :: back
      procedure :: push_back
      procedure :: begin
      procedure :: end
   end type Vector


   type :: VectorIterator
      private
      class (Vector), pointer :: reference
      integer :: current = -1
   contains
      procedure :: get
      procedure :: next
   end type Vector


contains

   
   integer function get_size(this)
      class(Vector), intent(in) :: this
      get_size = size(this%elements)
   end function get_size


   function at(this, i)
      type(type), pointer :: at
      class(Vector), target :: this
      integer, intent(in) :: i
      at => this%elements(i)
   end function at


   function back(this)
      type(type), pointer :: back
      class(Vector), target :: this
      back => this%elements(size(this%elements))
   end function back


   subroutine push_back(this, item)
      class(Vector), intent(inout) :: this
      type(type), intent(in) :: item

      type(type), allocatable :: tmp(:)
      integer :: n

      n = this%size()

      call move_alloc(this%elements, tmp)
      allocate(this%elements(n+1))
      this%elements(1:n) = tmp

      this%elements(n+1) = item

   end subroutine push_back

   ...
   
end module Vector_mod
