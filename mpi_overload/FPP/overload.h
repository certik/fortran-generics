! $Id$

#ifdef TYPE_
#undef TYPE_
#endif

#ifdef MPITYPE_
#undef MPITYPE_
#endif

#ifdef TYPEKIND_
#undef TYPEKIND_
#endif

#ifdef TYPEKINDSTR_
#undef TYPEKINDSTR_
#endif

#ifdef SUB_
#undef SUB_
#endif

#ifdef SUB__
#undef SUB__
#endif

#ifdef SUB___
#undef SUB___
#endif

#ifdef SUBSTR_
#undef SUBSTR_
#endif

#ifdef SUBSTR__
#undef SUBSTR__
#endif

#ifdef SUBSTR___
#undef SUBSTR___
#endif

#ifdef EKIND_
#undef EKIND_
#endif

#ifdef EKIND__
#undef EKIND__
#endif

#ifdef EKIND___
#undef EKIND___
#endif

#if (VARTYPE_ == 0)
#define MPITYPE_ MPI_BYTE
#define TYPEKIND_ STRING
#define TYPEKINDSTR_ 'STRING'

#elif (VARTYPE_ == 1)
#define MPITYPE_ MPI_INTEGER
#define TYPE_ INTEGER
#define TYPEKIND_ I4
#define TYPEKINDSTR_ 'I4'

#elif (VARTYPE_ == 2)
#define MPITYPE_ MPI_LOGICAL
#define TYPE_ LOGICAL
#define TYPEKIND_ L4
#define TYPEKINDSTR_ 'L4'

#elif (VARTYPE_ == 3)
#define MPITYPE_ MPI_REAL
#define TYPE_ REAL
#define TYPEKIND_ R4
#define TYPEKINDSTR_ 'R4'

#elif (VARTYPE_ == 4)
#define MPITYPE_ MPI_DOUBLE_PRECISION
#define TYPE_ REAL
#define TYPEKIND_ R8
#define TYPEKINDSTR_ 'R8'
#endif


#define IDENTITY(x)x

#define    TKR_        FOO__(TYPEKIND_,RANK_)
#define    FOO__(A,B)  FOO___(A,B)
!#define    FOO___(A,B)  A ## _ ## B
#define FOO___(A,B) IDENTITY(A)IDENTITY(_)IDENTITY(B)

#define    SUB_           SUB__(NAME_,TYPEKIND_,RANK_)
#define    SUB__(N,A,B)   SUB___(N,A,B)
#define SUB___(N,A,B) IDENTITY(N)IDENTITY(A)IDENTITY(_)IDENTITY(B)

#define SUBSTR_ SUBSTR__(NAMESTR_, TYPEKINDSTR_,RANKSTR_)
#define SUBSTR__(N,A,B)  SUBSTR___(N,A,B)
#define SUBSTR___(N,A,B) N // A // B

#define EKIND_ EKIND__(TYPEKIND_)  
#define EKIND__(A) EKIND___(A)
#define EKIND___(A) IDENTITY(ESMF_KIND_)IDENTITY(A)

#if (RANK_ == 0)
#define DIMENSIONS_
#define RANKSTR '0'
#endif

#if (RANK_ == 1)
#define DIMENSIONS_ (:)
#define RANKSTR_ '1'
#endif

#if (RANK_ == 2)
#define DIMENSIONS_ (:,:)
#define RANKSTR_ '2'
#endif

#if (RANK_ == 3)
#define DIMENSIONS_ (:,:,:)
#define RANKSTR_ '3'
#endif

#if (RANK_ == 4)
#define DIMENSIONS_ (:,:,:,:)
#define RANKSTR_ '4'
#endif

#if (RANK_ == 5)
#define DIMENSIONS_ (:,:,:,:,:)
#define RANKSTR_ '5'
#endif
			 
