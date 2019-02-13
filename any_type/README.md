# The same function for different types

Currently one has to do:

```fortran
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
```

With generics one can do:

```fortran
    <T> function f(x)
    <T>, intent(in) :: x
    f = x + 1
    end function
```
