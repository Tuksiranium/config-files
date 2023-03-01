
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

VERBOSE = 0
ifeq (${VERBOSE}, 0)
	H = @
endif

#------------------------------------------------------------------------------

.PHONY: all build run memcheck configure clean clean_all renew_config doc init

#- BUILD, RUN, DEBUG ----------------------------------------------------------
all build ${CMAKE_BUILD_DIR}/${TARGET}:
	$(H)cmake --build ${CMAKE_BUILD_DIR} --target ${TARGET} -j 12

run: ${CMAKE_BUILD_DIR}/${TARGET}
	$(H)@./$^

memcheck: ${CMAKE_BUILD_DIR}/${TARGET}
	$(H)valgrind --leak-check=full $^
#------------------------------------------------------------------------------

#- UTILS ----------------------------------------------------------------------
configure: ${CMAKE_BUILD_DIR}
	$(H)cmake						\
	-DCMAKE_BUILD_TYPE=${MODE}				\
	-DCMAKE_MAKE_PROGRAM=${GENERATOR}			\
	-DCMAKE_EXPORT_COMPILE_COMMANDS=${LINK_COMPILE_CMD}	\
	${CMAKE_OPT} -G ${GENERATOR_FULL} -S . -B $^
ifeq (${LINK_COMPILE_CMD}, 1)
	$(H)ln -s ./bin/debug/compile_commands.json .
endif

${CMAKE_BUILD_DIR}:
	$(H)mkdir -p $@

clean:
	$(H)${GENERATOR} -C ${CMAKE_BUILD_DIR} clean

clean_all:
	$(H)rm -rf ./bin

renew_config: clean_all configure

doc:
	$(H)doxygen
#------------------------------------------------------------------------------

#- INITIALISATION -------------------------------------------------------------
STRUCT_DIRS = src include
init:
	$(H)mkdir -p ${STRUCT_DIRS}
	$(H)curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/cpp_templ3/CMakeLists.txt' > CMakeLists.txt
	$(H)sed -i "3s/project-name/${TARGET}/" CMakeLists.txt
	$(H)sed -i "6s/main.cpp/${TARGET}.cpp/" CMakeLists.txt
	$(H)curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/cpp_templ3/main.cpp' > src/${TARGET}.cpp
	$(H)sed -i "4s/project-name/${TARGET}/" src/${TARGET}.cpp
	$(H)curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/cpp_templ3/gitignore' > .gitignore
	$(H)echo "# ${TARGET} (cpp project)" > README.md
	$(H)git init && git add . && git commit -m "init ${TARGET}"
	$(H)$(MAKE) configure
#------------------------------------------------------------------------------

