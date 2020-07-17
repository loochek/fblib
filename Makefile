build:
	aarch64-linux-android29-clang -c fblib/fblib.c -o fblib/fblib.a
	aarch64-linux-android29-clang -c test.c -o test.a
	aarch64-linux-android29-clang fblib/fblib.a test.a -o fbdraw
clean:
	rm -f test.a fblib/fblib.a fbdraw
	
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