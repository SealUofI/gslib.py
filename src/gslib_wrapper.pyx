from gslib cimport comm,comm_init,comm_free
from gslib cimport gs_data,gslib_gs_setup
from gslib cimport gs_auto,gs_pairwise,gs_crystal_router,\
    gs_all_reduce
from gslib cimport gs_add,gs_mul,gs_min,gs_max,gs_bpr

cimport cython
from libc.stdlib cimport malloc,free

cdef class GS(object):
    cdef int ec;
    cdef comm c
    cdef gs_data *g

    def __cinit__(self,ec=0):
        self.ec=ec
        comm_init(&self.c,ec)

    def __dealloc__(self):
        comm_free(&self.c)

    def setup(self,ids_in):
        cdef int *idd
        idd=<int*>malloc(len(ids_in)*cython.sizeof(int))

        if idd is NULL:
            raise MemoryError()

        for i in range(len(ids_in)):
            idd[i]=ids_in[i]

        cdef int n=len(ids_in) 
        self.g=gslib_gs_setup(idd,n,&self.c,0,gs_auto,1)

    def get_id(self):
        return self.c.id

    def get_np(self):
        return self.c.np

    def is_setup_valid(self):
        if self.g is NULL:
            return False
        else:
            return True
