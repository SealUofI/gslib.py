cdef extern from "name.h":
    str PREFIXED_NAME(str)

cdef extern from "types.h":
    str WHEN_LONG_LONG(str)

cdef extern from "c99.h":
    pass

cdef extern from "fail.h":
    pass

cdef extern from "comm.h":
    # TODO: Update when using MPI
    ctypedef int comm_ext
    ctypedef int comm_req

    struct comm:
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

    ctypedef array buffer_

cdef extern from "gs.h":
    struct gs_data:
        pass

    cdef enum gs_method:
        gs_auto,
        gs_pairwise,
        gs_crystal_router,
        gs_all_reduce

    void gs(void *u, gs_dom dom, gs_op op, unsigned transpose,
            gs_data *gsh, buffer_ *buf)
    void gs_vec(void *u, unsigned vn, gs_dom dom, gs_op op,
                unsigned transpose, gs_data *gsh, buffer_ *buf)
