module Comms_mod(type, kind, rank)
   use, intrinsic :: iso_fortran_env, only: REAL_KINDS, INTEGER_KINDS
   implicit none
   type :: type
   integer :: kind
   integer :: rank

   
   public :: bcast
   public :: gather
   public :: scatter


   ! Not quite worth "looping" over TKR for declaring generic interfaces
   interface bcast
      module procedure bcast_integer_int32_0
      module procedure bcast_integer_int32_1
      module procedure bcast_integer_int32_2
      module procedure bcast_integer_int32_3
      module procedure bcast_integer_int32_4
      module procedure bcast_integer_int32_5
      module procedure bcast_real_real32_0
      module procedure bcast_real_real32_1
      module procedure bcast_real_real32_2
      module procedure bcast_real_real32_3
      module procedure bcast_real_real32_4
      module procedure bcast_real_real32_5
      module procedure bcast_real_real64_0
      module procedure bcast_real_real64_1
      module procedure bcast_real_real64_2
      module procedure bcast_real_real64_3
      module procedure bcast_real_real64_4
      module procedure bcast_real_real64_5
   end interface bcast

   interface gather
      module procedure gather_integer_int32_0
      module procedure gather_integer_int32_1
      module procedure gather_integer_int32_2
      module procedure gather_integer_int32_3
      module procedure gather_integer_int32_4
      module procedure gather_integer_int32_5
      module procedure gather_real_real32_0
      module procedure gather_real_real32_1
      module procedure gather_real_real32_2
      module procedure gather_real_real32_3
      module procedure gather_real_real32_4
      module procedure gather_real_real32_5
      module procedure gather_real_real64_0
      module procedure gather_real_real64_1
      module procedure gather_real_real64_2
      module procedure gather_real_real64_3
      module procedure gather_real_real64_4
      module procedure gather_real_real64_5
   end interface gather


   interface scatter
      module procedure scatter_integer_int32_0
      module procedure scatter_integer_int32_1
      module procedure scatter_integer_int32_2
      module procedure scatter_integer_int32_3
      module procedure scatter_integer_int32_4
      module procedure scatter_integer_int32_5
      module procedure scatter_real_real32_0
      module procedure scatter_real_real32_1
      module procedure scatter_real_real32_2
      module procedure scatter_real_real32_3
      module procedure scatter_real_real32_4
      module procedure scatter_real_real32_5
      module procedure scatter_real_real64_0
      module procedure scatter_real_real64_1
      module procedure scatter_real_real64_2
      module procedure scatter_real_real64_3
      module procedure scatter_real_real64_4
      module procedure scatter_real_real64_5
   end interface scatter



contains

   ! integer(kind=INT32)
#define VARTYPE_ 1
#include "overload_ranks.h"
#undef_kind

   ! real(kind=REAL32)
#define VARTYPE_ 2
#include "overload_ranks.h"
#undef_kind

   ! real(kind=REAL64)
#define VARTYPE_ 3
#include "overload_ranks.h"
#undef_kind
end module
   
