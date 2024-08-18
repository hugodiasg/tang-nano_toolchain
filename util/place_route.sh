source define.sh

nextpnr-himbaechel --json $PROJ_NAME.json \
                   --write pnr$PROJ_NAME.json \
                   --device $DEVICE \
                   --vopt cst=$CST_NAME.cst
gowin_pack -d $DEVICE -o $PROJ_NAME.fs pnr$PROJ_NAME.json 
