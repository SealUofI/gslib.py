cdef extern from "name.h":
    pass

cdef extern from "types.h":
    pass

cdef extern from "c99.h":
    pass

cdef extern from "fail.h":
    pass

cdef extern from "comm.h":
    # TODO: Update when using MPI
    ctypedef int comm_ext
    ctypedef int comm_req

    struct comm:
        unsigned int np
        unsigned int id_
        pass

    void comm_init(comm *c, comm_ext ec)
    void comm_free(comm *c)

cdef extern from "gs_defs.h":
    cdef enum gs_dom:
        gs_double,
        gs_float,
        gs_int,
        gs_long

    cdef enum gs_op:
        gs_add,
        gs_mul,
        gs_min,
        gs_max,
        gs_bpr

cdef extern from "mem.h":
    struct array:
        pass

    ctypedef array buffer

cdef extern from "gs.h":
    struct gs_data:
        pass

    cdef enum gs_method:
        gs_auto,
        gs_pairwise,
        gs_crystal_router,
        gs_all_reduce

    gs_data *gslib_gs_setup(int *idd, int n, comm *com,
                      int unique, gs_method method, int verbose)
    void gs(void *u, gs_dom dom, gs_op op, unsigned transpose,
            gs_data *gsh, buffer *buf)
    void gs_vec(void *u, unsigned vn, gs_dom dom, gs_op op,
                unsigned transpose, gs_data *gsh, buffer *buf)

#    void gs_unique(slong ∗id, uint n, const struct comm ∗comm)
#    void gs_many(void ∗const ∗u, unsigned k, gs dom dom, gs op op, unsigned transpose , struct gs data ∗gsh , buffer ∗buf)
