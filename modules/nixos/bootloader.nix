{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      efiSupport = true;
      device = "nodev";
      extraEntries = ''
        menuentry 'Arch Linux (on /dev/nvme0n1p4)' --class arch --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-simple-eac5eddd-8b01-48ea-9b3e-0f85c8a10efd' {
        	insmod part_gpt
        	insmod fat
        	search --no-floppy --fs-uuid --set=root 9028-D5F4
        	linux /vmlinuz-linux root=UUID=eac5eddd-8b01-48ea-9b3e-0f85c8a10efd rw loglevel=3 quiet
        	initrd /initramfs-linux.img
        }
        submenu 'Advanced options for Arch Linux (on /dev/nvme0n1p4)' $menuentry_id_option 'osprober-gnulinux-advanced-eac5eddd-8b01-48ea-9b3e-0f85c8a10efd' {
        	menuentry 'Arch Linux (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux--eac5eddd-8b01-48ea-9b3e-0f85c8a10efd' {
        		insmod part_gpt
        		insmod fat
        		search --no-floppy --fs-uuid --set=root 9028-D5F4
        		linux /vmlinuz-linux root=UUID=eac5eddd-8b01-48ea-9b3e-0f85c8a10efd rw loglevel=3 quiet
        		initrd /initramfs-linux.img
        	}
        	menuentry 'Arch Linux, with Linux linux (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux--eac5eddd-8b01-48ea-9b3e-0f85c8a10efd' {
        		insmod part_gpt
        		insmod fat
        		search --no-floppy --fs-uuid --set=root 9028-D5F4
        		linux /vmlinuz-linux root=UUID=eac5eddd-8b01-48ea-9b3e-0f85c8a10efd rw loglevel=3 quiet
        		initrd /initramfs-linux.img
        	}
        	menuentry 'Arch Linux, with Linux linux (fallback initramfs) (on /dev/nvme0n1p4)' --class gnu-linux --class gnu --class os $menuentry_id_option 'osprober-gnulinux-/vmlinuz-linux--eac5eddd-8b01-48ea-9b3e-0f85c8a10efd' {
        		insmod part_gpt
        		insmod fat
        		search --no-floppy --fs-uuid --set=root 9028-D5F4
        		linux /vmlinuz-linux root=UUID=eac5eddd-8b01-48ea-9b3e-0f85c8a10efd rw loglevel=3 quiet
        		initrd /initramfs-linux-fallback.img
        	}
        }
      '';
    };
  };
}
