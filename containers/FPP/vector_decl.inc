   ! args _vector_type, _vector_element_type, _vector_iterator_type

#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name,_vector_type)

   type :: _vector_type
      private
      type (_vector_element_type), allocatable :: elements(:)
   contains
      procedure :: size => _MANGLE(size)
      procedure :: back => _MANGLE(back)
      procedure :: push_back => _MANGLE(push_back)
      procedure :: at => _MANGLE(at)
      procedure :: begin => _MANGLE(begin)
      procedure :: end => _MANGLE(end)
   end type _vector_type

   type :: _vector_iterator_type
      private
      class (_vector_type), pointer :: referenc => null()
      integer :: current = -1
   contains
      procedure :: get => _MANGLE(get)
      procedure :: next => _MANGLE(next)
   end type _vector_iterator_type

#undef _MANGLE
