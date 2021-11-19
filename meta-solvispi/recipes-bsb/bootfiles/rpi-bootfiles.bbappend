SUMMARY = "Recipe to create bcm2711-bootfiles directory in the image deploy directory that contains overlays and trimmed version of config.txt."


do_after_deploy() {
    # Make a simple config.txt
    rm ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt
    touch ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt
    echo 'kernel=kernel_rpilinux.img' >> ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt
    echo 'arm_64bit=1' >> ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt
    echo 'enable_uart=1' >> ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/config.txt

    # Make a simple cmdline.txt
    rm ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/cmdline.txt
    touch ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/cmdline.txt
    echo 'dwc_otg.lpm_enable=0 console=serial0,115200 console=ttyS0 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait' >> ${DEPLOY_DIR_IMAGE}/${BOOTFILES_DIR_NAME}/cmdline.txt

}

addtask after_deploy before do_build after do_install do_deploy