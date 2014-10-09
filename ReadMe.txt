This repository has dependencies for the game engine.


Instructions on how to use will be written soon enough.


To initalize a new repo, use the following commands:

git clone --recursive https://github.com/kubanphillipay/dependencies.git



To pull the submodules for existing repos, use:

git submodule update --init --recursive


Here i will document changed i made to each of the dependencies:
SDL:
Had to change external program to do sys_link in SDL_BINARY dir and not the overall binary dir.  This was causing the SDL.so to be in one directory higher than it should have been

GLEW:
Created a cmake list file.  Not to complicated

Boost:
Used boost bcp to extract smaller modules out of boost.  Then i created CMakefiles for each of those submodules
