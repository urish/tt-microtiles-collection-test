tinytapeout: tt_main.si
	silice-make.py -s tt_main.si -b tinytapeout -t tinytapeout -p basic -o BUILD_$(subst :,_,$@) -a force-reset-init,split-inouts $(ARGS)
	cp BUILD_$(subst :,_,$@)/build.v ../project.v

verilator: tt_sim_main.si
	silice-make.py -s tt_sim_main.si -b $@ -p basic,vga -o BUILD_$(subst :,_,$@) -t shell  -a force-reset-init,split-inouts $(ARGS)

data: pre.si
	mkdir -p ../build
	# ./get_data.sh
	silice-make.py -s pre.si -b bare -o BUILD_textures

clean:
	rm -rf BUILD_*
