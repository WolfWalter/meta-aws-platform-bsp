require recipes-core/images/core-image-minimal.bb

CORE_OS = "\
    openssh openssh-keygen openssh-sftp-server \
    tzdata ntp \
"

DEV_SDK = "\
    libstdc++ \
"

AWS_TOOLS = "\
    aws-iot-device-sdk-python-v2 \
    aws-iot-device-client \
"

RPI4_EXTRA = "\
    i2c-tools \
    python3-smbus \
    dhcpcd \
    iptables \
    ca-certificates \
"

IMAGE_INSTALL:append += " \
    ${CORE_OS} \
    ${DEV_SDK} \
    ${AWS_TOOLS} \
    ${RPI4_EXTRA} \
"