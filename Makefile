include config.mk

CFLAGS += -Wall -Wno-switch -fopenmp -std=gnu99 -O3 -I . $(CPPFLAGS)
CXXFLAGS += -Wall -Wno-unused-function -Wno-unused-variable -Wno-sign-compare -Wno-unused-but-set-variable -Wno-reorder -Wno-switch -fopenmp -std=gnu++0x -O3 -I . $(CPPFLAGS)
#CXXFLAGS += -Wno-stringop-truncation
LDFLAGS += -fopenmp
LIBS +=

LIBRELION_OBJECTS := \
	build/obj/args.o \
	build/obj/assembly.o \
	build/obj/autopicker.o \
	build/obj/autopicker_mpi.o \
	build/obj/backprojector.o \
	build/obj/complex.o \
	build/obj/CPlot2D.o \
	build/obj/ctf.o \
	build/obj/ctffind_runner.o \
	build/obj/ctffind_runner_mpi.o \
	build/obj/error.o \
	build/obj/euler.o \
	build/obj/exp_model.o \
	build/obj/fftw.o \
	build/obj/filename.o \
	build/obj/flex_analyser.o \
	build/obj/funcs.o \
	build/obj/healpix_sampling.o \
	build/obj/helix.o \
	build/obj/helix_inimodel2d.o \
	build/obj/image.o \
	build/obj/local_symmetry.o \
	build/obj/local_symmetry_mpi.o \
	build/obj/mask.o \
	build/obj/matrix1d.o \
	build/obj/matrix2d.o \
	build/obj/memory.o \
	build/obj/metadata_container.o \
	build/obj/metadata_label.o \
	build/obj/metadata_table.o \
	build/obj/micrograph_model.o \
	build/obj/ml_model.o \
	build/obj/ml_optimiser.o \
	build/obj/ml_optimiser_mpi.o \
	build/obj/motioncorr_runner.o \
	build/obj/motioncorr_runner_mpi.o \
	build/obj/mpi.o \
	build/obj/multidim_array.o \
	build/obj/numerical_recipes.o \
	build/obj/parallel.o \
	build/obj/particle_subtractor.o \
	build/obj/pipeline_control.o \
	build/obj/pipeline_jobs.o \
	build/obj/pipeliner.o \
	build/obj/postprocessing.o \
	build/obj/preprocessing.o \
	build/obj/preprocessing_mpi.o \
	build/obj/projector.o \
	build/obj/reconstructor.o \
	build/obj/reconstructor_mpi.o \
	build/obj/scheduler.o \
	build/obj/strings.o \
	build/obj/symmetries.o \
	build/obj/tabfuncs.o \
	build/obj/tiff_converter.o \
	build/obj/time.o \
	build/obj/transformations.o \
	build/obj/acc/cpu/cpu_helper_functions.o \
	build/obj/acc/cpu/cpu_projector_plan.o \
	build/obj/acc/cpu/cpu_backprojector.o \
	build/obj/acc/cpu/cpu_projector.o \
	build/obj/acc/cpu/cpu_ml_optimiser.o \
	build/obj/acc/cpu/cpu_kernels/helper.o \
	build/obj/jaz/structure_tensor.o \
	build/obj/jaz/slice_helper.o \
	build/obj/jaz/obs_model.o \
	build/obj/jaz/legacy_obs_model.o \
	build/obj/jaz/new_ft.o \
	build/obj/jaz/Fourier_helper.o \
	build/obj/jaz/distribution_helper.o \
	build/obj/jaz/volume_integration.o \
	build/obj/jaz/spectral_helper.o \
	build/obj/jaz/fsc_helper.o \
	build/obj/jaz/svd_helper.o \
	build/obj/jaz/noise_helper.o \
	build/obj/jaz/aberration_fit.o \
	build/obj/jaz/motion/two_hyperparameter_fit.o \
	build/obj/jaz/motion/gp_motion_fit.o \
	build/obj/jaz/motion/motion_helper.o \
	build/obj/jaz/motion/motion_refiner.o \
	build/obj/jaz/motion/motion_estimator.o \
	build/obj/jaz/motion/alignment_set.o \
	build/obj/jaz/motion/motion_param_estimator.o \
	build/obj/jaz/motion/motion_refiner_mpi.o \
	build/obj/jaz/motion/three_hyperparameter_fit.o \
	build/obj/jaz/motion/frame_recombiner.o \
	build/obj/jaz/fftw_helper.o \
	build/obj/jaz/tomo/tomo_stack.o \
	build/obj/jaz/resampling_helper.o \
	build/obj/jaz/local_motion_fit.o \
	build/obj/jaz/tomo/imod_helper.o \
	build/obj/jaz/volume_converter.o \
	build/obj/jaz/complex_io.o \
	build/obj/jaz/img_proc/image_op.o \
	build/obj/jaz/img_proc/filter_helper.o \
	build/obj/jaz/img_proc/color_helper.o \
	build/obj/jaz/io/star_converter.o \
	build/obj/jaz/ctf/equation2x2.o \
	build/obj/jaz/ctf/ctf_refiner.o \
	build/obj/jaz/ctf/magnification_estimator.o \
	build/obj/jaz/ctf/ctf_refiner_mpi.o \
	build/obj/jaz/ctf/defocus_helper.o \
	build/obj/jaz/ctf/defocus_estimator.o \
	build/obj/jaz/ctf/tilt_estimator.o \
	build/obj/jaz/ctf/tilt_helper.o \
	build/obj/jaz/ctf/magnification_helper.o \
	build/obj/jaz/ctf/aberration_estimator.o \
	build/obj/jaz/ctf/bfactor_refiner.o \
	build/obj/jaz/ctf/delocalisation_helper.o \
	build/obj/jaz/ctf/modular_ctf_optimisation.o \
	build/obj/jaz/convolution_helper.o \
	build/obj/jaz/image_log.o \
	build/obj/jaz/t_complex.o \
	build/obj/jaz/stack_helper.o \
	build/obj/jaz/jaz_config.o \
	build/obj/jaz/refinement_helper.o \
	build/obj/jaz/interpolation.o \
	build/obj/jaz/optimization/nelder_mead.o \
	build/obj/jaz/optimization/optimization.o \
	build/obj/jaz/optimization/gradient_descent.o \
	build/obj/jaz/optimization/lbfgs.o \
	build/obj/jaz/reference_map.o \
	build/obj/jaz/vtk_helper.o \
	build/obj/jaz/micrograph_handler.o \
	build/obj/jaz/ctf_helper.o \
	build/obj/jaz/tomo/backprojection_helper.o \
	build/obj/jaz/damage_helper.o \
	build/obj/jaz/Gaussian_pyramid.o \
	build/obj/jaz/parallel_ft.o \
	build/obj/jaz/tomo/projection_helper.o \
	build/obj/jaz/complex_io.o \
	build/obj/jaz/lbfgs/lbfgs.o \
	build/obj/jaz/d3x3/dsyevv3.o \
	build/obj/jaz/d3x3/slvsec3.o \
	build/obj/jaz/d3x3/dsyevh3.o \
	build/obj/jaz/d3x3/dsyev2.o \
	build/obj/jaz/d3x3/dsyevq3.o \
	build/obj/jaz/d3x3/dsyevj3.o \
	build/obj/jaz/d3x3/dsyevd3.o \
	build/obj/jaz/d3x3/dsyevc3.o \
	build/obj/jaz/d3x3/dsytrd3.o \
	build/obj/jaz/math/Zernike.o \
	build/obj/Healpix_2.15a/cxxutils.o \
	build/obj/Healpix_2.15a/healpix_base.o \
	build/obj/macros.o

TARGETS := \
	align_symmetry \
	autopick \
	autopick_mpi \
	convert_star \
	ctf_refine \
	ctf_refine_mpi \
	ctf_toolbox \
	defocus_stats \
	demodulate \
	double_bfac_fit \
	estimate_gain \
	external_reconstruct \
	find_tiltpairs \
	flex_analyse \
	flex_analyse_mpi \
	helix_toolbox \
	image_handler \
	import \
	interpolation_test \
	localsym \
	localsym_mpi \
	mask_create \
	merge_particles \
	motion_refine \
	motion_refine_mpi \
	mrc2vtk \
	paper_data_synth \
	particle_FCC \
	particle_reposition \
	particle_select \
	particle_subtract \
	particle_subtract_mpi \
	particle_symmetry_expand \
	plot_delocalisation \
	postprocess \
	postprocess_mpi \
	prepare_subtomo \
	preprocess \
	preprocess_mpi \
	project \
	reconstruct \
	reconstruct_mpi \
	refine \
	refine_mpi \
	reposition \
	run_ctffind \
	run_ctffind_mpi \
	run_motioncorr \
	run_motioncorr_mpi \
	scheduler \
	stack_create \
	star_handler \
	tiltpair_plot

TARGETS_WITH_TIFF := \
	convert_to_tiff \
	convert_to_tiff_mpi

BUILD_DIRECTORIES := \
	build/obj/acc/cpu/cpu_kernels \
	build/obj/jaz/ctf \
	build/obj/jaz/d3x3 \
	build/obj/jaz/img_proc \
	build/obj/jaz/io \
	build/obj/jaz/lbfgs \
	build/obj/jaz/math \
	build/obj/jaz/motion \
	build/obj/jaz/optimization \
	build/obj/jaz/tomo \
	build/obj/Healpix_2.15a \
	build/obj/apps \
	build/lib \
	build/bin

default:	$(BUILD_DIRECTORIES) $(addprefix build/bin/relion_,$(TARGETS))

.SECONDARY:	$(addprefix build/obj/apps/,$(addsuffix .o,$(TARGETS))) $(OBJECTS)

build/bin/relion_flex_analyse:	build/obj/apps/flex_analyse.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(MPI_LIBS) $(LIBS)

build/bin/relion_particle_polish:	build/obj/apps/particle_polish.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(MPI_LIBS) $(LIBS)

build/bin/relion_postprocess:	build/obj/apps/postprocess.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(MPI_LIBS) $(LIBS)

build/bin/relion_%_mpi:	build/obj/apps/%_mpi.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(MPI_LIBS) $(LIBS)

build/bin/relion_%:	build/obj/apps/%.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(LIBS)

build/lib/librelion.a:	$(LIBRELION_OBJECTS)
	$(AR) -r $@ $^

$(BUILD_DIRECTORIES):
	mkdir -p $@

build/obj/macros.cpp:	src/macros.cpp.in
	sed "s/@GIT_SHA1@/`cut -c -7 \".git/\`sed 's/^ref: //' .git/HEAD\`\"`/" $< > $@

build/obj/%.o:	src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

build/obj/%.o:	src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

build/obj/%.o:	src/%.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf build
