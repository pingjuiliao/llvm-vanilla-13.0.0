#!/usr/bin/python3
import os
import sys
import multiprocessing

LLVM_ROOT = "./llvm-project"
nproc = multiprocessing.cpu_count() // 2

pwd = "."
def error(msg) :
    print("Error: " + msg)
    quit()

def build_llvm() :

    llvm_root = os.path.abspath(LLVM_ROOT)
    llvm_build= llvm_root + "/build"
    clang = llvm_build + "/bin/clang"
    #if os.path.exists(clang) :
    #    return

    if not os.path.exists(llvm_root) :
        error("Please change directory to the root of repo")
    if not os.path.exists(llvm_build) :
        os.mkdir(llvm_build)

    pwd = os.path.abspath(os.getcwd())
    ls = os.listdir(llvm_build)
    os.chdir(llvm_build)

    # cmake
    if len(ls) == 0 or "remake" in sys.argv:
        os.system(f"""cmake \
                -DLLVM_ENABLE_PROJECTS=clang \
                -DLLVM_TARGETS_TO_BUILD=X86 \
                -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_SHARED_LIBS=On \
                -DLLVM_BUILD_TOOLS=On \
                -DLLVM_BUILD_TESTS=Off \ \
                -DLLVM_BUILD_EXAMPLES=Off \
                -DLLVM_BUILD_DOCS=Off \
                -DLLVM_INCLUDE_EXAMPLES=Off \
                -DLLVM_ENABLE_LTO=Off \
                -DLLVM_ENABLE_DOXYGEN=Off \
                -DLLVM_ENABLE_RTTI=Off \
                -DLLVM_BINUTILS_INCDIR=/home/pingjui/binutils/include \
                -G "Unix Makefiles" ../llvm""")

    # make
    os.system('make -j %d' % nproc)
    os.chdir(pwd)


## for IR pass:
"""
def build_pass() :
    build_dir = os.path.abspath("./build")
    if not os.path.exists(build_dir) :
        os.mkdir(build_dir)

    os.chdir(build_dir)
    # cmake
    os.system('cmake ..')

    # make
    os.system('make -j %d' % nproc)
"""

def main() :
    build_llvm()
    print("Done !")

if __name__ == '__main__' :
    main()
