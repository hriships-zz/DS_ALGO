#!/bin/sh
gcc -dynamiclib -o libinsertion_sort.dylib insertion_sort.c
cp libinsertion_sort.dylib /usr/lib/
rm libinsertion_sort.dylib
cp sorting.h /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/
gcc -Wall sorting_framework.c -o sorting /usr/lib/libinsertion_sort.dylib
cp sorting /usr/bin/

