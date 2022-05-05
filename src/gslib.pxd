cimport mpi4py.libmpi as libmpi


cdef extern from "config.h":
    pass

cdef extern from "c99.h":
    pass

cdef extern from "name.h":
    pass

cdef extern from "fail.h":
    pass

cdef extern from "types.h":
    pass

cdef extern from "mem.h":
    struct array:
        pass

    ctypedef array buffer

cdef extern from "gs_defs.h":
    ctypedef enum _gs_dom 'gs_dom':
        _gs_double 'gs_double',
        _gs_float  'gs_float',
        _gs_int    'gs_int' ,
        _gs_long   'gs_long'

    ctypedef enum _gs_op 'gs_op':
        _gs_add 'gs_add',
        _gs_mul 'gs_mul',
        _gs_min 'gs_min',
        _gs_max 'gs_max',
        _gs_bpr 'gs_bpr'

cdef extern from "comm.h":
    ctypedef libmpi.MPI_Comm comm_ext
    ctypedef libmpi.MPI_Request comm_req

    struct comm:
        unsigned int np
        unsigned int id
        pass

    void comm_init(comm *c, comm_ext ec)
    void comm_free(comm *c)

cdef extern from "gs.h":
    struct gs_data:
        pass

    cdef enum gs_method:
        gs_auto,
        gs_pairwise,
        gs_crystal_router,
        gs_all_reduce

    gs_data *gslib_gs_setup(int *idd,int n,comm *com,
                      int unique,gs_method method,int verbose)
    void gslib_gs(void *u,_gs_dom dom,_gs_op op,unsigned transpose,
            gs_data *gsh,buffer *buf)
    void gslib_gs_vec(void *u,unsigned vn,_gs_dom dom,_gs_op op,
                unsigned transpose,gs_data *gsh,buffer *buf)
