   ! args _map_type, _map_key_type, _map_value_type, _map_iterator_type

#define _set_type Set
#define _set_iterator_type  SetIterator
#define _set_element_type Pair

#include "set_impl.inc"

#undef _set_iterator_type
#undef _set_element_type
#undef _set_type


#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name,_map_type)

integer function _MANGLE(size)(this) result(size_)
   class (_map_type), intent(in) :: this
end function

subroutine _MANGLE(insert_key_value)(this, key, value)
   class (_map_type), target, intent(inout) :: this
   type (_map_key_type), intent(in) :: key
   type (_map_value_type), intent(in) :: value

   call this%insert(Pair(key,value))

end subroutine

subroutine _MANGLE(insert_pair)(this, p)
   class (_map_type), target, intent(inout) :: this
   type (Pair), intent(in) :: p

   call this%tree%insert(p)

end subroutine

function _MANGLE(begin)(this) result(begin)
   type (_map_iterator_type) :: begin
   class (_map_type), target, intent(in) :: this
end function

function _MANGLE(end)(this) result(end)
   type (_map_iterator_type) :: end
   class (_map_type), target, intent(in) :: this
end function


function _MANGLE(get_key)(this) result(key)
   type (_map_key_type), pointer :: key
   class (_map_iterator_type), intent(in) :: this
end function

function _MANGLE(get_value)(this) result(value)
   type (_map_value_type), pointer :: value
   class (_map_iterator_type), intent(in) :: this
end function


subroutine _MANGLE(next)(this)
   class (_map_iterator_type), intent(inout) :: this
end subroutine


logical function _MANGLE(equal)(a,b) result(equal)
   class (_map_iterator_type), intent(in) :: a
   class (_map_iterator_type), intent(in) :: b
end function

logical function _MANGLE(not_equal)(a,b) result(not_equal)
   class (_map_iterator_type), intent(in) :: a
   class (_map_iterator_type), intent(in) :: b
   not_equal = .not. (a == b)
end function

#undef _MANGLE
