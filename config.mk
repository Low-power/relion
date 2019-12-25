CC := gcc
CXX := g++
#CC := gcc-9.2
#CXX := g++-9.2
#CC := gcc-10-20191222
#CXX := g++-10-20191222
#CC := icc
#CXX := icpc -cxxlib=/usr

# icc(1) and icpc(1) option to enable restrict pointer optimization
#CFLAGS += -restrict
#CXXFLAGS += -restrict

# Machine depended options
CFLAGS += -march=native
CXXFLAGS += -march=native
#CFLAGS += -march=knl
#CXXFLAGS += -march=knl
#CFLAGS += -march=skylake-avx512
#CXXFLAGS += -march=skylake-avx512
#CFLAGS += -xKNL
#CXXFLAGS += -xKNL
#CFLAGS += -xCORE-AVX512
#CFLAGS += -xCORE-AVX2
#CXXFLAGS += -xCORE-AVX512
#CXXFLAGS += -xCORE-AVX2
#CFLAGS += -xSKYLAKE-AVX512
#CXXFLAGS += -xSKYLAKE-AVX512

# Define this if using Intel compilers
$CPPFLAGS += -D FAST_CENTERFFT=1

#CPPFLAGS += -D ALTCPU=1 -D PROJECTOR_NO_TEXTURES=1 -D HAVE_SINCOS=1 -D HAVE_TIFF=1
CPPFLAGS += -D ALTCPU=1 -D PROJECTOR_NO_TEXTURES=1 -D HAVE_SINCOS=1
USE_INTEL_MKL := 1
USE_INTEL_TBB := 1
USE_INTEL_MPI := 1
ifdef USE_INTEL_MKL
##DEFINES += -D MKL_ILP64=1
CPPFLAGS += -D MKLFFT=1 -I /opt/intel/compilers_and_libraries_2019/linux/mkl/include/fftw
LDFLAGS += -L /opt/intel/compilers_and_libraries_2019/linux/mkl/lib/intel64
##LIBS += -l mkl_intel_ilp64 -l mkl_gnu_thread -l mkl_core
#LIBS += -l mkl_intel_lp64 -l mkl_gnu_thread -l mkl_core
LIBS += -Wl,--as-needed -l mkl_rt
else
LIBS += -l fftw3 -l fftw3_threads
endif
ifdef USE_INTEL_TBB
CPPFLAGS += -I /opt/intel/compilers_and_libraries_2019.3.199/linux/tbb/include
LDFLAGS += -L /opt/intel/compilers_and_libraries_2019.3.199/linux/tbb/lib/intel64/gcc4.7
LIBS += -l tbb
else
LIBS +=
endif
ifdef USE_INTEL_MPI
CPPFLAGS += -I /opt/intel/compilers_and_libraries_2019/linux/mpi/intel64/include
LDFLAGS += -L /opt/intel/compilers_and_libraries_2019/linux/mpi/intel64/lib/release -L /opt/intel/compilers_and_libraries_2019/linux/mpi/intel64/libfabric/lib
#LIBS += -Wl,--as-needed -l mpi -l fabric
MPI_LIBS += -Wl,--as-needed -l mpi -l fabric
endif
