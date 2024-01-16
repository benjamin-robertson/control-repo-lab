#!/bin/bash

command="${PT_path}/Assessor-CLI.sh -b ${PT_path}/benchmarks/${PT_benchmark}"
echo $command

bash -c $command