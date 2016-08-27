#!/bin/sh
gcc -o libsort.dylib insertion_sort.c heap_sort.c merge_sort.c -dynamiclib
sudo cp libsort.dylib /usr/lib/
rm libsort.dylib
sudo cp sorting.h /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/
gcc  -o sorting sorting_framework.c -Wall /usr/lib/libsort.dylib
cp sorting /usr/bin/

