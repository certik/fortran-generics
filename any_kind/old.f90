module types
implicit none
integer, parameter :: dp = kind(0.d0)
integer, parameter :: qp = selected_real_kind(32)

end module


module inc
use types, only: dp, qp
implicit none

interface f
    module procedure f_single
    module procedure f_double
    module procedure f_quad
end interface

contains

    real function f_single(x) result(f)
    real, intent(in) :: x
    f = x + 1
    end function

    real(dp) function f_double(x) result(f)
    real(dp), intent(in) :: x
    f = x + 1
    end function

    real(qp) function f_quad(x) result(f)
    real(qp), intent(in) :: x
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
