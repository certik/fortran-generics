#ifdef _IDENTITY
#  undef _IDENTITY
#endif

#ifdef _CONCATENATE
#  undef _CONCATENATE
#endif

#ifdef __MANGLE
#  undef __MANGLE
#endif
   
#define _IDENTITY(a) a
#define _CONCATENATE(a,b) _IDENTITY(a)_IDENTITY(_)_IDENTITY(b)
#define __MANGLE(name,disambiguator) _CONCATENATE(name,disambiguator)
   
