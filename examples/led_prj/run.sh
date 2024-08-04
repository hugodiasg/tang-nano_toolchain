yosys -D LEDS_NR=3 -p "read_verilog led.v; synth_gowin -json led.json"
DEVICE='GW1N-LV1QN48C6/I5'  
BOARD='tangnano' 
nextpnr-himbaechel --json led.json \
                   --write pnrled.json \
                   --device $DEVICE \
                   --vopt cst=led_prj.cst
gowin_pack -d $DEVICE -o led.fs pnrled.json 
sudo openFPGALoader -b $BOARD led.fs
