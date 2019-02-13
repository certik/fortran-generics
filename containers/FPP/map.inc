   ! args _container_type, _iterator_type, _key_type, _value_type, _pair_type

   public :: _container_type
   public :: _iterator_type
   public :: _pair_type

#define _map_type _container_type
#define _map_key_type _key_type
#define _map_value_type _value_type
#define _map_iterator_type _iterator_type

#include "map_decl.inc"

   contains

#include "map_impl.inc"

#undef _map_iterator_type
#undef _map_key_type
#undef _map_value_type
#undef _map_type
