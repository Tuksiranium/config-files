PROJECT_NAME      := cpp-templ2

BINDIR            := bin
MAINDIR           := main
TESTDIR           := test

SRCDIR             = ${MAINDIR}/src
INCDIR             = ${MAINDIR}/include
PROJECT_TEST_NAME := ${PROJECT_NAME}.test
PROJECT_PATH       = ${BINDIR}/${PROJECT_NAME}
PROJECT_TEST_PATH  = ${BINDIR}/${PROJECT_TEST_NAME}

GENERATOR         := make
GEN_CMAKE_NAME    := 'Unix Makefiles'

COMPILE_MODE      := Debug


# BUILD & RUN ----------------------------------------------------
.PHONY: all build ctest run run_test

all: build
build: ${PROJECT_PATH} | ${PROJECT_TEST_PATH}

${PROJECT_PATH}:
${PROJECT_TEST_PATH}:
	@${GENERATOR} -C ${BINDIR}

run: build
	@./${PROJECT_PATH}
run_test: build
	@./${PROJECT_TEST_PATH}
ctest: build
	@(cd "${BINDIR}"; ctest)
#-----------------------------------------------------------------

# UTILS ----------------------------------------------------------
.PHONY: clean clean_all mk_compile_flags

clean:
	@${GENERATOR} -C ${BINDIR} clean

clean_all:
	@rm -rf ${BINDIR}

mk_compile_flags:
	@echo -e "-I\n./${INCDIR}\n-I\n./" > compile_flags.txt
#-----------------------------------------------------------------

# INITIALISATION -------------------------------------------------
.PHONY: init configure

init: .git configure ${SRCDIR} ${INCDIR} ${TESTDIR}

configure: ${MAINDIR}/main.cpp
	@cmake -S . -B ${BINDIR}                     \
		-G ${GEN_CMAKE_NAME}                 \
		-DCMAKE_BUILD_TYPE=${COMPILE_MODE}   \
		--fresh

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
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/CMakeLists-CPP' > $@

${SRCDIR}/main.cpp:
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/main.cpp' > $@
#-----------------------------------------------------------------
