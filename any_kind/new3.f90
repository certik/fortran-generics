module types
implicit none
integer, parameter :: dp = kind(0.d0)
integer, parameter :: qp = selected_real_kind(32)

end module


module inc
use iso_fortran_env, only: real_kinds
implicit none

interface f
    module procedure f_real32
    module procedure f_real64
    module procedure f_real128
end interface

contains

    DEFINE MACRO :: f_procs()
        MACRO integer i, thiskind
            MACRO DO i=1, size(real_kinds)
                MACRO thiskind = real_kinds(i)
                    function f_%%thiskind(x) result(r)
                    real(thiskind) :: x,r
                    r = x + 1
                    end function
        MACRO END DO
    END MACRO

    EXPAND f_procs()

end module


program test
use inc, only: f
use types, only: dp, qp
implicit none

print *, f(5.)
print *, f(5._dp)
print *, f(5._qp)

end
