module Vector_mod
   implicit none
   private

   public :: VECTOR
   public :: VECTOR_IMPL
   public :: VECTOR_DECL


   DEFINE MACRO MANGLE(name) name %% vector

   DEFINE MACRO :: VECTOR(element_type, container_type, iterator_type)

      EXPAND VECTOR_DECL(element_type, container_type, iterator_type)

      contains
   
      EXPAND VECTOR_IMPL(element_type, container_type, iterator_type)

   END MACRO



   DEFINE MACRO VECTOR_DECL(element_type, container_type, iterator_type)

      type :: container_type
         private
         type (element_type), allocatable :: elements(:)
      contains
         procedure :: at => at %% disambiguator
         procedure :: size => size %% disambiguator
         procedure :: push_back => push_back %% disambiguator
         procedure :: back => back %% disambiguator
         procedure :: begin => begin %% disambiguator
         procedure :: end => end %% disambiguator
      end type container_type

      type :: iterator_type
         private
         type (container_type), pointer :: reference
         integer :: current_idx = -1
      contains
         procedure :: get => get %% disambiguator
         procedure :: next => next %% disambiguator
      end type iterator_type

    END MACRO


    DEFINE MACRO VECTOR_IMPL(element_type, container_type, iterator_type, disambiguator)


      integer function get_size %% disambiguator (this)
         class (container_type), intent(in) :: this
         get_size = size(this%elements)
      end function get_size
      
      
      function at %% disambiguator (this, i)
         type (element_type), pointer :: at
         class (container_type), target :: this
         integer, intent(in) :: i
         
         at => this%elements(i)
      end function at
      
      
      function back %% disambiguator (this)
         type (element_type), pointer :: back
         class (container_type), target :: this
         
         back => this%elements(size %% disambiguator (this%elements))
         
      end function back
      
      
      subroutine push_back %% disambiguator (this, item)
         class (container_type), intent(inout) :: this
         type (element_type), intent(in) :: item
         
         type (element_type), allocatable :: tmp(:)
         integer :: n
         
         n = this%size()
         
         call move_alloc %% disambiguator (this%elements, tmp)
         allocate %% disambiguator (this%elements(n+1))
         this%elements(1:n) = tmp
         
         this%elements(n+1) = item
         
      end subroutine push_back %% disambiguator

      ...

   END MACRO

end module Vector_mod
