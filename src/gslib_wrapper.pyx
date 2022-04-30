cimport cython
from gslib cimport (_gs_add, _gs_bpr, _gs_double, _gs_float, _gs_int, _gs_long,
                    _gs_max, _gs_min, _gs_mul, comm, comm_free, comm_init,
                    gs_all_reduce, gs_auto, gs_crystal_router, gs_data,
                    gs_pairwise, gslib_gs, gslib_gs_setup)
from libc.stdlib cimport free, malloc


cpdef enum gs_dom:
    gs_double=_gs_double
    gs_float =_gs_float
    gs_int   =_gs_int
    gs_long  =_gs_long

cpdef enum gs_op:
    gs_add=_gs_add
    gs_mul=_gs_mul
    gs_min=_gs_min
    gs_max=_gs_max
    gs_bpr=_gs_bpr

cdef class GS(object):
    cdef int n_setup
    cdef comm c
    cdef int *idd
    cdef gs_data *g

    def __cinit__(self,ec=0):
        comm_init(&self.c,ec)

    def __dealloc__(self):
        comm_free(&self.c)
        free(self.idd)

    def setup(self,ids_in):
        cdef int n=len(ids_in)
        self.n_setup=n

        self.idd=<int*>malloc(n*cython.sizeof(int))

        if self.idd is NULL:
            raise MemoryError()

        for i in range(n):
            self.idd[i]=ids_in[i]

        self.g=gslib_gs_setup(self.idd,n,&self.c,0,gs_auto,1)

    def gs(self,values_in,dom,op):
        cdef int n=len(values_in)
        assert n==self.n_setup

        cdef double *u
        if(dom==gs_double):
            u=<double*>malloc(n*cython.sizeof(double))
        else:
            raise Exception("Data type not supported yet.")

        if u is NULL:
            raise MemoryError()

        for i in range(n):
            u[i]=values_in[i]

        gslib_gs(u,dom,op,0,self.g,NULL)

        for i in range(n):
            values_in[i]=u[i]
        free(u)

    def get_id(self):
        return self.c.id

    def get_np(self):
        return self.c.np

    def is_setup_valid(self):
        if self.g is NULL:
            return False
        else:
            return True
