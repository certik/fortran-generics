module types
implicit none
integer, parameter :: dp = kind(0.d0)
end module


module inc
use types, only: dp
implicit none

interface f
    module procedure f_int
    module procedure f_single
    module procedure f_double
end interface

contains

    integer function f_int(x) result(f)
    integer, intent(in) :: x
    f = x + 1
    end function

    real function f_single(x) result(f)
    real, intent(in) :: x
    f = x + 1
    end function

    real(dp) function f_double(x) result(f)
    real(dp), intent(in) :: x
    f = x + 1
    end function

end module


program test
use inc, only: f
use types, only: dp
implicit none

print *, f(5)
print *, f(5.)
print *, f(5._dp)

end
