#!/bin/bash

for file in `cat packages`; do 
    echo $file
    yaourt -S --noconfirm $file
done

