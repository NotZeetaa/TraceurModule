unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'mode/*' -d $TMPDIR >&2
mkdir -p $MODPATH/system/bin

ui_print " "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print "       Select Traceur Mode:  📳     "
ui_print "    ×××××××××××××××××××××××××××××××"
ui_print " "
ui_print "  Vol+ = Next; Vol- = Select"
ui_print " "
ui_print "  1. Traceur Enabler "
ui_print "  2. Traceur Disabler "
ui_print " "
ui_print "  Select: "
TC=1
while true; do
ui_print "   $TC"
	if $VKSEL; then
		TC=$((TC + 1))
	else 
		break
	fi
	if [ $TC -gt 2 ]; then
		TC=1
	fi
done
ui_print " "
ui_print "  Selected: $TC"
#
case $TC in
 1 ) FCTEXTAD1="Traceur Enabled"; cp -af $TMPDIR/mode/TCE $MODPATH/system/bin;;
 2 ) FCTEXTAD1="Traceur Disabled"; cp -af $TMPDIR/mode/TCD $MODPATH/system/bin;;
esac
ui_print " "
ui_print "- Mode: $FCTEXTAD1 "
sleep 3