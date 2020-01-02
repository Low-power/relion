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
	build/obj/particle_polisher.o \
	build/obj/particle_polisher_mpi.o \
	build/obj/particle_sorter.o \
	build/obj/particle_sorter_mpi.o \
	build/obj/pipeline_jobs.o \
	build/obj/pipeliner.o \
	build/obj/postprocessing.o \
	build/obj/preprocessing.o \
	build/obj/preprocessing_mpi.o \
	build/obj/projector.o \
	build/obj/reconstructor.o \
	build/obj/reconstructor_mpi.o \
	build/obj/strings.o \
	build/obj/symmetries.o \
	build/obj/tabfuncs.o \
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
	build/obj/jaz/motion/bfactor_estimator.o \
	build/obj/jaz/motion/motion_estimator.o \
	build/obj/jaz/motion/alignment_set.o \
	build/obj/jaz/motion/motion_param_estimator.o \
	build/obj/jaz/motion/motion_refiner_mpi.o \
	build/obj/jaz/motion/three_hyperparameter_fit.o \
	build/obj/jaz/motion/frame_recombiner.o \
	build/obj/jaz/fftw_helper.o \
	build/obj/jaz/tomo_stack.o \
	build/obj/jaz/resampling_helper.o \
	build/obj/jaz/local_motion_fit.o \
	build/obj/jaz/imod_helper.o \
	build/obj/jaz/volume_converter.o \
	build/obj/jaz/complex_io.o \
	build/obj/jaz/image_op.o \
	build/obj/jaz/filter_helper.o \
	build/obj/jaz/ctf/equation2x2.o \
	build/obj/jaz/ctf/ctf_refiner.o \
	build/obj/jaz/ctf/magnification_estimator.o \
	build/obj/jaz/ctf/ctf_refiner_mpi.o \
	build/obj/jaz/ctf/defocus_helper.o \
	build/obj/jaz/ctf/defocus_estimator.o \
	build/obj/jaz/ctf/tilt_estimator.o \
	build/obj/jaz/ctf/tilt_helper.o \
	build/obj/jaz/ctf/magnification_helper.o \
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
	build/obj/jaz/refinement_program.o \
	build/obj/jaz/frame_merge.o \
	build/obj/jaz/backprojection_helper.o \
	build/obj/jaz/damage_helper.o \
	build/obj/jaz/Gaussian_pyramid.o \
	build/obj/jaz/parallel_ft.o \
	build/obj/jaz/projection_helper.o \
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
	build/obj/Healpix_2.15a/cxxutils.o \
	build/obj/Healpix_2.15a/healpix_base.o

TARGETS := \
	align_symmetry \
	autopick \
	autopick_mpi \
	ctf_refine \
	ctf_refine_mpi \
	ctf_toolbox \
	defocus_stats \
	double_bfac_fit \
	find_tiltpairs \
	flex_analyse \
	flex_analyse_mpi \
	helix_toolbox \
	image_handler \
	interpolation_test \
	localsym \
	localsym_mpi \
	mask_create \
	motion_diff \
	motion_refine \
	motion_refine_mpi \
	motion_stats \
	mrc2vtk \
	paper_data_synth \
	particle_polish \
	particle_polish_mpi \
	particle_reposition \
	particle_sort \
	particle_sort_mpi \
	particle_symmetry_expand \
	postprocess \
	postprocess_mpi \
	prepare_subtomo \
	preprocess \
	preprocess_mpi \
	project \
	reconstruct \
	reconstruct_mpi \
	ref_aberration_plot \
	refine \
	refine_mpi \
	run_ctffind \
	run_ctffind_mpi \
	run_motioncorr \
	run_motioncorr_mpi \
	stack_create \
	star_combine \
	star_compare \
	star_handler \
	tiltpair_plot

GUI_TARGETS := \
	display \
	maingui \
	manualpick \
	pipeliner

BUILD_DIRECTORIES := \
	build/obj/acc/cpu/cpu_kernels \
	build/obj/jaz/ctf \
	build/obj/jaz/d3x3 \
	build/obj/jaz/lbfgs \
	build/obj/jaz/motion \
	build/obj/jaz/optimization \
	build/obj/Healpix_2.15a \
	build/obj/apps \
	build/lib \
	build/bin

default:	$(BUILD_DIRECTORIES) $(addprefix build/bin/relion_,$(TARGETS))

gui:	$(BUILD_DIRECTORIES) $(addprefix build/bin/relion_,$(GUI_TARGETS))

.SECONDARY:	$(addprefix build/obj/apps/,$(addsuffix .o,$(TARGETS) $(GUI_TARGETS))) $(OBJECTS)

build/bin/relion build/bin/relion_maingui:	build/obj/apps/maingui.o build/obj/gui_mainwindow.o build/obj/gui_jobwindow.o build/obj/gui_entries.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(FLTK_LIBS) $(LIBS)

build/bin/relion_display:	build/obj/apps/display.o build/obj/displayer.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(FLTK_LIBS) $(LIBS)

build/bin/relion_manualpick:	build/obj/apps/manualpick.o build/obj/manualpicker.o build/lib/librelion.a
	$(CXX) $(LDFLAGS) $^ -o $@ $(FLTK_LIBS) $(LIBS)

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

build/obj/%.o:	src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

build/obj/%.o:	src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

build/obj/%.o:	src/%.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf build
