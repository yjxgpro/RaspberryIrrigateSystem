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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/soiltest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/soiltest/build

# Include any dependencies generated for this target.
include CMakeFiles/soilSensor.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/soilSensor.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/soilSensor.dir/flags.make

CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o: CMakeFiles/soilSensor.dir/flags.make
CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o: ../src/soilSensor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/soiltest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o -c /home/pi/soiltest/src/soilSensor.cpp

CMakeFiles/soilSensor.dir/src/soilSensor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/soilSensor.dir/src/soilSensor.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/soiltest/src/soilSensor.cpp > CMakeFiles/soilSensor.dir/src/soilSensor.cpp.i

CMakeFiles/soilSensor.dir/src/soilSensor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/soilSensor.dir/src/soilSensor.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/soiltest/src/soilSensor.cpp -o CMakeFiles/soilSensor.dir/src/soilSensor.cpp.s

CMakeFiles/soilSensor.dir/src/main.cpp.o: CMakeFiles/soilSensor.dir/flags.make
CMakeFiles/soilSensor.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/soiltest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/soilSensor.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/soilSensor.dir/src/main.cpp.o -c /home/pi/soiltest/src/main.cpp

CMakeFiles/soilSensor.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/soilSensor.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/soiltest/src/main.cpp > CMakeFiles/soilSensor.dir/src/main.cpp.i

CMakeFiles/soilSensor.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/soilSensor.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/soiltest/src/main.cpp -o CMakeFiles/soilSensor.dir/src/main.cpp.s

# Object files for target soilSensor
soilSensor_OBJECTS = \
"CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o" \
"CMakeFiles/soilSensor.dir/src/main.cpp.o"

# External object files for target soilSensor
soilSensor_EXTERNAL_OBJECTS =

soilSensor: CMakeFiles/soilSensor.dir/src/soilSensor.cpp.o
soilSensor: CMakeFiles/soilSensor.dir/src/main.cpp.o
soilSensor: CMakeFiles/soilSensor.dir/build.make
soilSensor: CMakeFiles/soilSensor.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/soiltest/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable soilSensor"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/soilSensor.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/soilSensor.dir/build: soilSensor

.PHONY : CMakeFiles/soilSensor.dir/build

CMakeFiles/soilSensor.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/soilSensor.dir/cmake_clean.cmake
.PHONY : CMakeFiles/soilSensor.dir/clean

CMakeFiles/soilSensor.dir/depend:
	cd /home/pi/soiltest/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/soiltest /home/pi/soiltest /home/pi/soiltest/build /home/pi/soiltest/build /home/pi/soiltest/build/CMakeFiles/soilSensor.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/soilSensor.dir/depend

