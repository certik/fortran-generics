   ! args _set_type, _set_element_type, _set_iterator_type

#define _vector_type iVector
#define _vector_iterator_type iVectorIterator
#define _vector_element_type integer

#include "vector_decl.inc"

#undef _vector_type
#undef _vector_iterator_type
#undef _vector_element_type
   
#define _vector_type tVector
#define _vector_iterator_type tVectorIterator
#define _vector_element_type _set_element_type

#include "vector_decl.inc"

#undef _vector_type
#undef _vector_iterator_type
#undef _vector_element_type
   

#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name, _set_type)


   type :: _set_type
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
      procedure :: size => _MANGLE(size)
      procedure :: insert => _MANGLE(insert)
      procedure :: find => _MANGLE(find)
      procedure :: begin => _MANGLE(begin)
      procedure :: end => _MANGLE(end)
   end type _set_type

   type :: _set_iterator_type
      private
      class (_set_type), pointer :: reference => null()
      integer :: current = -1
   contains
      procedure :: get => _MANGLE(get)
      procedure :: next => _MANGLE(next)
   end type _set_iterator_type

#undef _MANGLE
