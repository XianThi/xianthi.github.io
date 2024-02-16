#!/bin/bash
cd tmp
for deb in "$@"
do
	ar p ../"$deb" control.tar.gz | tar -xz
	sed -i 's/iphoneos-arm/iphoneos-arm64/g' control
	tar czf control.tar.gz *[!z]
	ar r ../"$deb" control.tar.gz
	rm -r *
done
