   ! args _map_type, _map_key_type, _map_value_type, _map_iterator_type

#define _pair_key_type _map_key_type
#define _pair_value_type _map_value_type
#define _pair_type Pair

#include "pair_decl.inc"

#undef _pair_type
#undef _pair_value_type
#undef _pair_key_type



   
#define _set_type Set
#define _set_iterator_type  SetIterator
#define _set_element_type Pair

#include "set_decl.inc"

#undef _set_iterator_type
#undef _set_element_type
#undef _set_type


#include 'macros.inc'
#define _MANGLE(name) __MANGLE(name,_map_type)

   type :: _map_type
      private
      type (Set) :: tree
   contains
      procedure :: size => _MANGLE(size)
      procedure :: insert_key_value => _MANGLE(insert_key_value)
      procedure :: insert_pair => _MANGLE(insert_pair)
      generic :: insert => insert_key_value
      generic :: insert => insert_pair
      procedure :: begin => _MANGLE(begin)
      procedure :: end => _MANGLE(end)
   end type _map_type

   type :: _map_iterator_type
      private
      type (_map_type), pointer :: reference => null()
      type (SetIterator) :: current
   contains
      procedure :: next => _MANGLE(next)
      procedure :: get_key => _MANGLE(get_key)
      procedure :: get_value => _MANGLE(get_value)
      procedure :: equal => _MANGLE(equal)
      procedure :: not_equal => _MANGLE(not_equal)
      generic :: operator(==) => equal
      generic :: operator(/=) => not_equal
   end type _map_iterator_type
