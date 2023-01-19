PROJECT_NAME := cpp-cmake-templ
BINDIR		 := bin
SRCDIR		 := src
INCDIR		 := include
PROJECT_PATH  = ${BINDIR}/${PROJECT_NAME}

GENERATOR      := ninja
GEN_CMAKE_NAME  = Ninja


# BUILD & RUN ----------------------------------------------------
.PHONY: all build run
all: build

build: ${PROJECT_PATH}

${PROJECT_PATH}:
	@${GENERATOR} -C ${BINDIR}

run: build
	@./${PROJECT_PATH}
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
.PHONY: init configure git

init: git configure ${SRCDIR} ${INCDIR}

configure: main.cpp
	@cmake -S . -B ${BINDIR} -G ${GEN_CMAKE_NAME}

git: .gitignore
	@git init
	@echo "# ${PROJECT_NAME}" > README.md

.gitignore:
	@curl 'https://raw.githubusercontent.com/github/gitignore/main/C%2B%2B.gitignore' > $@
	@echo -e '\n#CMake:' >> $@
	@curl 'https://raw.githubusercontent.com/github/gitignore/main/CMake.gitignore' >> $@
	@echo -e "\n#Others:\n${BINDIR}/\n[Bb][Uu][Ii][Ll][Dd]/" >> $@

${SRCDIR} ${INCDIR}:
	mkdir -p $@

CMakeLists.txt:
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/CMakeLists-CPP' > $@

main.cpp:
	@curl 'https://raw.githubusercontent.com/Tuksiranium/config-files/master/code-templ/main.cpp' > $@
#-----------------------------------------------------------------