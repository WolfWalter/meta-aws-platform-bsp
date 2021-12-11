DESCRIPTION = "Simple helloworld application"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://main.cpp  file://CMakeLists.txt"


S = "${WORKDIR}"

inherit cmake

do_install() {
	install -d ${D}${bindir}
	install -m 0755 pubsub ${D}${bindir}
}

EXTRA_OECMAKE = ""

DEPENDS = "aws-iot-device-sdk-cpp-v2 aws-crt-cpp aws-c-iot aws-c-http"
RDEPENDS:${PN} = "aws-iot-device-sdk-cpp-v2"
