# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /opt/cmake-3.26.3/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.26.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspaces/GDM-Robotics/Mickey

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspaces/GDM-Robotics/Mickey/build

# Include any dependencies generated for this target.
include CMakeFiles/mickey.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mickey.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mickey.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mickey.dir/flags.make

CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj: CMakeFiles/mickey.dir/flags.make
CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj: /workspaces/GDM-Robotics/Mickey/src/c_toolchain_test.c
CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj: CMakeFiles/mickey.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspaces/GDM-Robotics/Mickey/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj"
	/usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj -MF CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj.d -o CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj -c /workspaces/GDM-Robotics/Mickey/src/c_toolchain_test.c

CMakeFiles/mickey.dir/src/c_toolchain_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mickey.dir/src/c_toolchain_test.c.i"
	/usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /workspaces/GDM-Robotics/Mickey/src/c_toolchain_test.c > CMakeFiles/mickey.dir/src/c_toolchain_test.c.i

CMakeFiles/mickey.dir/src/c_toolchain_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mickey.dir/src/c_toolchain_test.c.s"
	/usr/bin/arm-none-eabi-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /workspaces/GDM-Robotics/Mickey/src/c_toolchain_test.c -o CMakeFiles/mickey.dir/src/c_toolchain_test.c.s

# Object files for target mickey
mickey_OBJECTS = \
"CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj"

# External object files for target mickey
mickey_EXTERNAL_OBJECTS =

mickey.elf: CMakeFiles/mickey.dir/src/c_toolchain_test.c.obj
mickey.elf: CMakeFiles/mickey.dir/build.make
mickey.elf: CMakeFiles/mickey.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspaces/GDM-Robotics/Mickey/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable mickey.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mickey.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mickey.dir/build: mickey.elf
.PHONY : CMakeFiles/mickey.dir/build

CMakeFiles/mickey.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mickey.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mickey.dir/clean

CMakeFiles/mickey.dir/depend:
	cd /workspaces/GDM-Robotics/Mickey/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/GDM-Robotics/Mickey /workspaces/GDM-Robotics/Mickey /workspaces/GDM-Robotics/Mickey/build /workspaces/GDM-Robotics/Mickey/build /workspaces/GDM-Robotics/Mickey/build/CMakeFiles/mickey.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mickey.dir/depend
