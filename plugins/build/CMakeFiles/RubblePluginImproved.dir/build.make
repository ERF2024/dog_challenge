# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_SOURCE_DIR = /home/andrea/ERF/src/DogChallenge/plugins

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andrea/ERF/src/DogChallenge/plugins/build

# Include any dependencies generated for this target.
include CMakeFiles/RubblePluginImproved.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/RubblePluginImproved.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/RubblePluginImproved.dir/flags.make

CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o: CMakeFiles/RubblePluginImproved.dir/flags.make
CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o: ../RubblePlugin.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andrea/ERF/src/DogChallenge/plugins/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o -c /home/andrea/ERF/src/DogChallenge/plugins/RubblePlugin.cc

CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andrea/ERF/src/DogChallenge/plugins/RubblePlugin.cc > CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.i

CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andrea/ERF/src/DogChallenge/plugins/RubblePlugin.cc -o CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.s

# Object files for target RubblePluginImproved
RubblePluginImproved_OBJECTS = \
"CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o"

# External object files for target RubblePluginImproved
RubblePluginImproved_EXTERNAL_OBJECTS =

libRubblePluginImproved.so: CMakeFiles/RubblePluginImproved.dir/RubblePlugin.cc.o
libRubblePluginImproved.so: CMakeFiles/RubblePluginImproved.dir/build.make
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libSimTKsimbody.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libSimTKmath.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libSimTKcommon.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libblas.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/liblapack.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libblas.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_client.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_gui.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_sensors.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_rendering.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_physics.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_ode.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_transport.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_msgs.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_util.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_common.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_gimpact.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_opcode.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_opende_ou.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_signals.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libsdformat.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgreMain.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgreTerrain.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgrePaging.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libignition-transport4.so.4.0.0
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libignition-msgs1.so.1.0.0
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libignition-common1.so.1.0.1
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libignition-fuel_tools1.so.1.0.0
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/liblapack.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_client.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_gui.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_sensors.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_rendering.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_physics.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_ode.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_transport.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_msgs.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_util.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_common.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_gimpact.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_opcode.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libgazebo_opende_ou.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_signals.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libsdformat.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgreMain.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_signals.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_regex.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libsdformat.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgreMain.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgreTerrain.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libOgrePaging.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libprotobuf.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libignition-math4.so.4.0.0
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libuuid.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libuuid.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libswscale.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libswscale.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavdevice.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavdevice.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavformat.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavformat.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavcodec.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavcodec.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavutil.so
libRubblePluginImproved.so: /usr/lib/x86_64-linux-gnu/libavutil.so
libRubblePluginImproved.so: CMakeFiles/RubblePluginImproved.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/andrea/ERF/src/DogChallenge/plugins/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libRubblePluginImproved.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RubblePluginImproved.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/RubblePluginImproved.dir/build: libRubblePluginImproved.so

.PHONY : CMakeFiles/RubblePluginImproved.dir/build

CMakeFiles/RubblePluginImproved.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/RubblePluginImproved.dir/cmake_clean.cmake
.PHONY : CMakeFiles/RubblePluginImproved.dir/clean

CMakeFiles/RubblePluginImproved.dir/depend:
	cd /home/andrea/ERF/src/DogChallenge/plugins/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrea/ERF/src/DogChallenge/plugins /home/andrea/ERF/src/DogChallenge/plugins /home/andrea/ERF/src/DogChallenge/plugins/build /home/andrea/ERF/src/DogChallenge/plugins/build /home/andrea/ERF/src/DogChallenge/plugins/build/CMakeFiles/RubblePluginImproved.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/RubblePluginImproved.dir/depend

