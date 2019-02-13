module types
implicit none
integer, parameter :: dp = kind(0.d0)
integer, parameter :: qp = selected_real_kind(32)

end module


module inc
implicit none

contains

    real(<T>) function f(x)
    real(<T>), intent(in) :: x
    f = x + 1
    end function

end module


program test
use inc, only: f
use types, only: dp, qp
implicit none

print *, f(5.)
print *, f(5._dp)
print *, f(5._qp)

end
