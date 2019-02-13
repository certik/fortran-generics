   ! args _container_type, _type, _iterator_type

   public :: _container_type
   public :: _iterator_type

#define _vector_type _container_type
#define _vector_element_type _type
#define _vector_iterator_type _iterator_type

#include "vector_decl.inc"

   contains

#include "vector_impl.inc"

#undef _vector_iterator_type
#undef _vector_element_type
#undef _vector_type
      
