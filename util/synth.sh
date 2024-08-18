source define.sh
yosys -D LEDS_NR=3 -p "read_verilog $PROJ_NAME.v; synth_gowin -json $PROJ_NAME.json"


