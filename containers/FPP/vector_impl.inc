   ! args _vector_type, _vector_element_type, _vector_iterator_type

#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name,_vector_type)

integer function _MANGLE(size)(this) result(size_)
   class (_vector_type), intent(in) :: this
   size_ = size(this%elements)
end function

function _MANGLE(at)(this, i) result(at)
   type (_vector_element_type), pointer :: at
   class (_vector_type), target :: this
   integer, intent(in) :: i

   at => this%elements(i)

end function

function _MANGLE(back)(this) result(back)
   type (_vector_element_type), pointer :: back
   class (_vector_type), target :: this

   back => this%elements(size(this%elements))
end function


subroutine _MANGLE(push_back) (this, item)
   class (_vector_type), intent(inout) :: this
   type (_vector_element_type), intent(in) :: item
   
   type (_vector_element_type), allocatable :: tmp(:)
   integer :: n
   
   n = this%size()
         
   call move_alloc (this%elements, tmp)
   allocate (this%elements(n+1))
   this%elements(1:n) = tmp
         
   this%elements(n+1) = item
   
end subroutine


function _MANGLE(begin) (this) result(begin)
   type (_vector_iterator_type) :: begin
   class (_vector_type), target, intent(in) :: this
end function

function _MANGLE(end) (this) result(end)
   type (_vector_iterator_type) :: end
   class (_vector_type), target, intent(in) :: this
end function


function _MANGLE(get)(this) result(get)
   type (_vector_element_type), pointer :: get
   class (_vector_iterator_type), intent(in) :: this
end function

subroutine _MANGLE(next)(this)
   class (_vector_iterator_type), intent(inout) :: this
end subroutine

#undef _MANGLE
