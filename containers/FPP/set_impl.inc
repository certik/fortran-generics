   ! args _set_type, _set_element_type, _set_iterator_type

#define _vector_type iVector
#define _vector_iterator_type iVectorIterator
#define _vector_element_type integer

#include "vector_impl.inc"

#undef _vector_type
#undef _vector_iterator_type
#undef _vector_element_type

#define _vector_type tVector
#define _vector_iterator_type tVectorIterator
#define _vector_element_type _set_element_type

#include "vector_impl.inc"

#undef _vector_type
#undef _vector_iterator_type
#undef _vector_element_type

#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name, _set_type)


   integer function _MANGLE(size)(this) result(size_)
      class (_set_type), intent(in) :: this
      size_ = this%tsize
   end function

   subroutine _MANGLE(insert)(this, value)
      class (_set_type), intent(inout) :: this
      type (_set_element_type), intent(in) :: value
   end subroutine

   function _MANGLE(find)(this, value) result(find)
      type (_set_iterator_type) :: find
      class (_set_type), target, intent(in) :: this
      type (_set_element_type), intent(in) :: value
   end function

   function _MANGLE(begin)(this) result(begin)
      type (_set_iterator_type) :: begin
      class (_set_type), target, intent(in) :: this
   end function


   function _MANGLE(end)(this) result(end)
      type (_set_iterator_type) :: end
      class (_set_type), target, intent(in) :: this
   end function


   ! Iterator methods

   function _MANGLE(get)(this) result(get)
      type (_set_element_type), pointer :: get
      class (_set_iterator_type), intent(in) :: this
   end function

   subroutine _MANGLE(next)(this)
      class (_set_iterator_type), intent(inout) :: this
   end subroutine

#undef _MANGLE
