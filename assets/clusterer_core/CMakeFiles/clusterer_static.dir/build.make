# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/runner/work/clusterer_core/clusterer_core

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/runner/work/clusterer_core/clusterer_core/build

# Include any dependencies generated for this target.
include CMakeFiles/clusterer_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/clusterer_static.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/clusterer_static.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/clusterer_static.dir/flags.make

CMakeFiles/clusterer_static.dir/codegen:
.PHONY : CMakeFiles/clusterer_static.dir/codegen

CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o: CMakeFiles/clusterer_static.dir/includes_CUDA.rsp
CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o: /home/runner/work/clusterer_core/clusterer_core/src/cuda_resources/cuda_all.cu
CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o"
	/usr/local/cuda-12.6/bin/nvcc -forward-unknown-to-host-compiler $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o -MF CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o.d -x cu -rdc=true -c /home/runner/work/clusterer_core/clusterer_core/src/cuda_resources/cuda_all.cu -o CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o

CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CUDA source to CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CUDA source to assembly CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_flow/external_dataflow_controller.cpp
CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_flow/external_dataflow_controller.cpp

CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_flow/external_dataflow_controller.cpp > CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.i

CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_flow/external_dataflow_controller.cpp -o CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.s

CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/clustering/external_cuda_clusterer.cpp
CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/clustering/external_cuda_clusterer.cpp

CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/clustering/external_cuda_clusterer.cpp > CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.i

CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/clustering/external_cuda_clusterer.cpp -o CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.s

CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/io/external_data_reader.cpp
CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/io/external_data_reader.cpp

CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/io/external_data_reader.cpp > CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.i

CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_nodes/io/external_data_reader.cpp -o CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/calibration.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/calibration.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/calibration.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/calibration.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/cluster.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/cluster.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/cluster.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/cluster.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/mm_hit.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/mm_hit.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/mm_hit.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/mm_hit.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/node_args.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/node_args.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/node_args.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/node_args.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx3_hit.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx3_hit.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx3_hit.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx3_hit.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.s

CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx4_hit.cpp
CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o -MF CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx4_hit.cpp

CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx4_hit.cpp > CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.i

CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/data_structs/tpx4_hit.cpp -o CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.s

CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/devices/current_device.cpp
CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o -MF CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/devices/current_device.cpp

CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/devices/current_device.cpp > CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.i

CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/devices/current_device.cpp -o CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.s

CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/devices/current_system.cpp
CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o -MF CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/devices/current_system.cpp

CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/devices/current_system.cpp > CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.i

CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/devices/current_system.cpp -o CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.s

CMakeFiles/clusterer_static.dir/src/utils.cpp.o: CMakeFiles/clusterer_static.dir/flags.make
CMakeFiles/clusterer_static.dir/src/utils.cpp.o: /home/runner/work/clusterer_core/clusterer_core/src/utils.cpp
CMakeFiles/clusterer_static.dir/src/utils.cpp.o: CMakeFiles/clusterer_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/clusterer_static.dir/src/utils.cpp.o"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/clusterer_static.dir/src/utils.cpp.o -MF CMakeFiles/clusterer_static.dir/src/utils.cpp.o.d -o CMakeFiles/clusterer_static.dir/src/utils.cpp.o -c /home/runner/work/clusterer_core/clusterer_core/src/utils.cpp

CMakeFiles/clusterer_static.dir/src/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/clusterer_static.dir/src/utils.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/runner/work/clusterer_core/clusterer_core/src/utils.cpp > CMakeFiles/clusterer_static.dir/src/utils.cpp.i

CMakeFiles/clusterer_static.dir/src/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/clusterer_static.dir/src/utils.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/runner/work/clusterer_core/clusterer_core/src/utils.cpp -o CMakeFiles/clusterer_static.dir/src/utils.cpp.s

# Object files for target clusterer_static
clusterer_static_OBJECTS = \
"CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o" \
"CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o" \
"CMakeFiles/clusterer_static.dir/src/utils.cpp.o"

# External object files for target clusterer_static
clusterer_static_EXTERNAL_OBJECTS =

libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/cuda_resources/cuda_all.cu.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_flow/external_dataflow_controller.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_nodes/clustering/external_cuda_clusterer.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_nodes/io/external_data_reader.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/calibration.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/cluster.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/mm_hit.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/node_args.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/tpx3_hit.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/data_structs/tpx4_hit.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/devices/current_device.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/devices/current_system.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/src/utils.cpp.o
libclusterer_static.a: CMakeFiles/clusterer_static.dir/build.make
libclusterer_static.a: CMakeFiles/clusterer_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library libclusterer_static.a"
	$(CMAKE_COMMAND) -P CMakeFiles/clusterer_static.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clusterer_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/clusterer_static.dir/build: libclusterer_static.a
.PHONY : CMakeFiles/clusterer_static.dir/build

CMakeFiles/clusterer_static.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/clusterer_static.dir/cmake_clean.cmake
.PHONY : CMakeFiles/clusterer_static.dir/clean

CMakeFiles/clusterer_static.dir/depend:
	cd /home/runner/work/clusterer_core/clusterer_core/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/runner/work/clusterer_core/clusterer_core /home/runner/work/clusterer_core/clusterer_core /home/runner/work/clusterer_core/clusterer_core/build /home/runner/work/clusterer_core/clusterer_core/build /home/runner/work/clusterer_core/clusterer_core/build/CMakeFiles/clusterer_static.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/clusterer_static.dir/depend
