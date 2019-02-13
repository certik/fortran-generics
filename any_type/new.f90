module types
implicit none
integer, parameter :: dp = kind(0.d0)
end module


module inc
use types, only: dp
implicit none

contains

    <T> function f(x)
    <T>, intent(in) :: x
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
