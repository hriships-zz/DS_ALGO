#!/bin/sh
gcc -dynamiclib -o libsort.dylib insertion_sort.c heap_sort.c merge_sort.c
cp libsort.dylib /usr/lib/
rm libsort.dylib
cp sorting.h /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/
gcc -Wall sorting_framework.c -o sorting /usr/lib/libsort.dylib
cp sorting /usr/bin/

