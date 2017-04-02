#!/bin/bash

source $(dirname "$0")/utils.sh

start=`date +%s`

$(dirname "$0")/general-setup.sh
$(dirname "$0")/ruby-setup.sh
$(dirname "$0")/project-setup.sh
$(dirname "$0")/verify.sh

end=`date +%s`
runtime=$((end-start))
echo_headline "Provision executed in $(seconds_to_hh_mm_ss $runtime)"
