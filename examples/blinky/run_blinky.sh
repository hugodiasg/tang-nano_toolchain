yosys -D LEDS_NR=3 -p "read_verilog blinky.v; synth_gowin -json blinky.json"
DEVICE='GW1N-LV1QN48C6/I5'  
BOARD='tangnano' 
nextpnr-himbaechel --json blinky.json \
                   --write pnrblinky.json \
                   --device $DEVICE \
                   --vopt cst=$BOARD.cst
gowin_pack -d $DEVICE -o pack.fs pnrblinky.json 
sudo openFPGALoader -b $BOARD pack.fs
