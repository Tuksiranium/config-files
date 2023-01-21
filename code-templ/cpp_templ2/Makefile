PROJECT_NAME      := cpp-templ2

BINDIR            := bin
MAINDIR           := main
TESTDIR           := test

SRCDIR             = "${MAINDIR}/src"
INCDIR             = "${MAINDIR}/include"
PROJECT_TEST_NAME  = "${PROJECT_NAME}.test"
PROJECT_PATH       = "${BINDIR}/${PROJECT_NAME}"
PROJECT_TEST_PATH  = "${BINDIR}/${PROJECT_TEST_NAME}"

GENERATOR         := make
GEN_CMAKE_NAME    := 'Unix Makefiles'

COMPILE_MODE      := Debug
EXPORT_COMPILE_COMMANDS := 1


# BUILD & RUN ----------------------------------------------------
.PHONY: all build run run_test ctest 
all: build

build: compile_commands.json
	@${GENERATOR} -C ${BINDIR}

run:
	@./${PROJECT_PATH}

run_test:
	@./${PROJECT_TEST_PATH}

ctest:
	@(cd "${BINDIR}"; ctest)
#-----------------------------------------------------------------

# UTILS ----------------------------------------------------------
.PHONY: clean clean_all reconfigure

clean:
	@${GENERATOR} -C ${BINDIR} clean
	@rm -f "compile_commands.json"

clean_all:
	@rm -rf ${BINDIR}
	@rm -f "compile_commands.json"

compile_commands.json:
ifeq (${EXPORT_COMPILE_COMMANDS}, 1)
	@ln -s "./${BINDIR}/compile_commands.json" .
endif

reconfigure:
	@cmake -S . -B ${BINDIR}                     \
		-G ${GEN_CMAKE_NAME}                 \
		-DCMAKE_BUILD_TYPE=${COMPILE_MODE}   \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=${EXPORT_COMPILE_COMMANDS} \
		--fresh
#-----------------------------------------------------------------

# INITIALISATION -------------------------------------------------
.PHONY: init configure

init: .git ${SRCDIR} ${INCDIR} ${TESTDIR} ${MAINDIR}/main.cpp ${TESTDIR}/tstmain.cpp configure 

configure:
	@cmake -S . -B ${BINDIR}                     \
		-G ${GEN_CMAKE_NAME}                 \
		-DCMAKE_BUILD_TYPE=${COMPILE_MODE}   \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=${EXPORT_COMPILE_COMMANDS}

.git: .gitignore
	@git init
	@echo "# ${PROJECT_NAME}" > README.md

.gitignore:
	@curl 'https://raw.githubusercontent.com/github/gitignore/main/C%2B%2B.gitignore' > $@
	@echo -e '\n#CMake:' >> $@
	@curl 'https://raw.githubusercontent.com/github/gitignore/main/CMake.gitignore' >> $@
	@echo -e "\n#Others:\n${BINDIR}/\n[Bb][Uu][Ii][Ll][Dd]/" >> $@

${SRCDIR} ${INCDIR} ${TESTDIR}:
	mkdir -p $@

CMakeLists.txt:
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/cpp_templ2/CMakeLists.txt' > $@

${MAINDIR}/main.cpp:
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/main.cpp' > $@
${TESTDIR}/tstmain.cpp:
	@touch $@
#-----------------------------------------------------------------
