module VectorMethods_Mod
   implicit none

   public :: size
   public :: at
   public :: back
   public :: push_back
   public :: begin
   public :: end

contains

   integer template function get_size(this)
      class(type(*)), intent(in) :: this
      get_size = size(this%elements)
   end function get_size


   template function at(this, i)
      type(type(this), pointer :: at
      class(Vector), target :: this
      integer, intent(in) :: i
      at => this%elements(i)
   end function at


   template function back(this)
      type(type), pointer :: back
      class(Vector), target :: this
      back => this%elements(size(this%elements))
   end function back


   template subroutine push_back(this, item)
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

   
