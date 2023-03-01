
TARGET = project-name

DEBUG_DIR   := ./bin/debug
RELEASE_DIR := ./bin/release

GENERATOR = make
MODE = Debug
LINK_COMPILE_CMD = 0

CMAKE_DEBUG_OPT =
CMAKE_RELEASE_OPT =

#- AUTO CONFIG ----------------------------------------------------------------
GENERATOR_FULL = Ninja
ifeq (${GENERATOR}, make)
	GENERATOR_FULL = 'Unix Makefiles'
endif

ifeq (${MODE}, Release)
	CMAKE_OPT = ${CMAKE_RELEASE_OPT}
	CMAKE_BUILD_DIR = ${RELEASE_DIR}
else
	CMAKE_OPT = ${CMAKE_DEBUG_OPT}
	CMAKE_BUILD_DIR = ${DEBUG_DIR}
endif
#------------------------------------------------------------------------------

.PHONY: all build run memcheck configure clean clean_all doc

#- BUILD, RUN, DEBUG ----------------------------------------------------------
all build ${CMAKE_BUILD_DIR}/${TARGET}:
	cmake --build ${CMAKE_BUILD_DIR} --target ${TARGET} -j 12

run: ${CMAKE_BUILD_DIR}/${TARGET}
	@./$^

memcheck: ${CMAKE_BUILD_DIR}/${TARGET}
	valgrind --leak-check=full $^
#------------------------------------------------------------------------------

#- UTILS ----------------------------------------------------------------------
configure: ${CMAKE_BUILD_DIR}
	cmake							\
	-DCMAKE_BUILD_TYPE=${MODE}				\
	-DCMAKE_MAKE_PROGRAM=${GENERATOR}			\
	-DCMAKE_EXPORT_COMPILE_COMMANDS=${LINK_COMPILE_CMD}	\
	${CMAKE_OPT} -G ${GENERATOR_FULL} -S . -B $^
ifeq (${LINK_COMPILE_CMD}, 1)
	ln -s ./bin/debug/compile_commands.json .
endif

${CMAKE_BUILD_DIR}:
	mkdir -p $@

clean:
	${GENERATOR} -C ${CMAKE_BUILD_DIR} clean

clean_all:
	rm -rf ./bin

doc:
	doxygen
#------------------------------------------------------------------------------

