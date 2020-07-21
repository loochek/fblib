CC=aarch64-linux-android29-clang
CFLAGS=-O2
export CC CFLAGS
build:
	make -C fblib
	make -C test
	$(CC) $(CFLAGS) fblib/fblib.a test/test.a -o fbdraw
clean:
	make -C fblib clean
	make -C test clean
	rm -f fbdraw
	
run: build headless
	adb push fbdraw "//data/local/tmp"
	adb shell su -c "chmod 777 //data/local/tmp/fbdraw"
	adb shell su -c "//data/local/tmp/fbdraw"
	
headless:
	adb shell su -c "setprop ctl.stop zygote"
	sleep 1
	adb shell su -c "killall bootanimation || true"
	
headmore:
	adb shell su -c start
	
# shortcut
android: headmore