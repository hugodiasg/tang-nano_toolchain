yosys -D LEDS_NR=3 -p "read_verilog clock_divider.v; synth_gowin -json clock_divider.json"
DEVICE='GW1N-LV1QN48C6/I5'  
BOARD='tangnano' 
nextpnr-himbaechel --json clock_divider.json \
                   --write pnrclock_divider.json \
                   --device $DEVICE \
                   --vopt cst=clock_divider.cst
gowin_pack -d $DEVICE -o clock_divider.fs pnrclock_divider.json 
sudo openFPGALoader -b $BOARD clock_divider.fs
