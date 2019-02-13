   public :: _container_type
   public :: _iterator_type

#define _set_type _container_type
#define _set_element_type _type
#define _set_iterator_type _iterator_type


#include "set_decl.inc"

   contains

#include "set_impl.inc"


#undef _set_iterator_type
#undef _set_element_type
#undef _set_type
