module Set_mod
   use Vector_mod
   implicit none
   private

   PUBLIC :: SET
   PUBLIC :: SET_DECL
   PUBLIC :: SET_IMPL


   DEFINE MACRO :: SET(element_type, container_type, iterator_type, disambiguator)
      EXPAND SET_DECL(element_type, container_type, iterator_type, disambiguator)
      contains
      EXPAND SET_IMPL(element_type, container_type, iterator_type, disambiguator)
   END MACRO


   DEFINE MACRO :: SET_DECL(element_type, container_type, iterator_type, disambiguator)
      EXPAND VECTOR_DECL(element_type, tVector,  t %% disambiguator)
      EXPAND VECTOR_DECL(element_type, iVector,  i %% disambiguator)
   
      type :: container_type
         type (tVector) :: items
         type (iVector) :: parents
         type (iVector) :: lefts
         type (iVector) :: rights
         type (iVector) :: heights
         
         integer :: root = -1
         integer :: tsize = 0
         integer :: next_free = 0
      contains
         procedure :: size => size  %% disambiguator
         procedure :: insert => insert  %% disambiguator
         procedure :: find => find  %% disambiguator
         procedure :: begin => begin  %% disambiguator
         procedure :: end => end  %% disambiguator
         
      end type container_type

      type :: iterator_type
         type (container_type), pointer :: reference => null()
         integer :: current = -1
      contains
         procedure :: next => next  %% disambiguator
         procedure :: equals => equals  %% disambiguator
         generic :: operator(==) => equals  %% disambiguator
      end type iterator_type

   END MACRO
      
contains
   
   DEFINE MACRO :: SET_IMPL(element_type, container_type, iterator_type, )
      EXPAND VECTOR_IMPL(element_type, tVector)
      EXPAND VECTOR_IMPL(element_type, iVector)

      ...

   END MACRO

end module Set_mod
