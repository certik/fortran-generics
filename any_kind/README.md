# The same function for the same type but different kinds

Currently one has to do:

```fortran
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
```

With generics one can do:

```fortran
    real(<T>) function f(x)
    real(<T>), intent(in) :: x
    f = x + 1
    end function
```

or using macros:

```fortran
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
```
