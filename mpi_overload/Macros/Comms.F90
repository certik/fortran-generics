module Comms_mod
   implicit none
   private

   public :: BCAST
   public :: GATHER
   public :: SCATTER


   DEFINE MACRO DIMS(rank)
   MACRO IF (rank == 0) THEN
   MACRO ELSE IF (rank == 1) THEN
      (:)
   MACRO ELSE IF (rank == 2) THEN
      (:,:)
   MACRO ELSE IF (rank == 3) THEN
      (:,:,:)
   MACRO ELSE IF (rank == 4) THEN
      (:,:,:,:)
   MACRO ELSE IF (rank == 5) THEN
      (:,:,:,:,:)
   END MACRO


   DEFINE MACRO NAME(base_name, type, kind, rank)
   base_name %% type %% kind %% rank
   END MACRO

   DEFINE MACRO GENERIC_ONE(base_name, type, kind, rank)
       module procedure EXPAND NAME(base_name, type, kind, rank)
   END MACRO


   DEFINE MACRO GENERIC(base_name, type, max_rank)
       MACRO INTEGER i, k
       MACRO do k = 0, size(type %% kinds)
          MACRO do i = 0, max_rank
             MACRO EXPAND OVERLOAD_ONE(base_name, real, type %% kinds (k), rank)
          MACRO END DO 
       MACRO END DO
   END MACRO
   

   DEFINE MACRO OVERLOAD(base_macro, type, kind, max_rank)
       MACRO INTEGER i, k
       MACRO DO k = 0, size(type %% kinds)
          MACRO DO i = 0, max_rank
             EXPAND base_macro(base_name, real, type %% kinds (k), rank)
          MACRO END DO 
       MACRO END DO
   END MACRO

   EXPAND base_macro(type, kind, rank)
   
   DEFINE MACRO BCAST_MACRO(type, kind, rank)
      subroutine EXPAND NAME(bcast,type,kind,rank) (layout, data, vm)
         type (ESMF_DELayout) :: layout
         type(kind) :: data EXPAND DIMS(rank)
         type (ESMF_VM) :: vm
         ! implementation details ...
      end subroutine
   END MACRO

   DEFINE MACRO GATHER_MACRO(type, kind, rank)
      subroutine EXPAND NAME(gather,type,kind,rank) (layout, data, vm)
         type (ESMF_DELayout) :: layout
         type(kind) :: data EXPAND DIMS(rank)
         type (ESMF_VM) :: vm
         ! implementation details ...
      end subroutine
   END MACRO
   
   DEFINE MACRO SCATTER_MACRO(type, kind, rank)
      subroutine EXPAND NAME(scatter,type,kind,rank) (layout, data, vm)
         type (ESMF_DELayout) :: layout
         type(kind) :: data EXPAND DIMS(rank)
         type (ESMF_VM) :: vm
         ! implementation details ...
      end subroutine
   END MACRO
   

   interface bcast
      EXAND GENERIC(bcast, real, 5)
      EXAND GENERIC(bcast, integer, 5)
   end interface bcast

   interface gather
      EXAND GENERIC(gather, real, 5)
      EXAND GENERIC(gather, integer, 5)
   end interface gather

   interface scatter
      EXAND GENERIC(scatter, real, 5)
      EXAND GENERIC(scatter, integer, 5)
   end interface scatter


contains

   
   EXPAND OVERLOAD(BCAST_MACRO, real 5)
   EXPAND OVERLOAD(BCAST_MACRO, integer 5)

   EXPAND OVERLOAD(GATHER_MACRO, real 5)
   EXPAND OVERLOAD(GATHER_MACRO, integer 5)

   EXPAND OVERLOAD(SCATTER_MACRO, real 5)
   EXPAND OVERLOAD(SCATTER_MACRO, integer 5)


end module Comms_mod
   
