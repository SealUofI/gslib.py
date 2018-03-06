cdef extern from "name.h":
    str PREFIXED_NAME(str)

cdef extern from "types.h":
    str WHEN_LONG_LONG(str)

cdef extern from "comm.h":
    struct comm:
        pass

cdef extern from "gs_defs.h":
    cdef enum gs_dom:
        gs_double,
        gs_float,
        gs_int,
        gs_long

cdef extern from "c99.h":
    pass

cdef extern from "fail.h":
    pass

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
