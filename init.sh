#!/bin/sh

chmod a+x -R sh_tools

./sh_tools/init_composer.sh
./sh_tools/init_db.sh
./sh_tools/fix_fs.sh