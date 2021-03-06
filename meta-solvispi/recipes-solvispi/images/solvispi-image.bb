require recipes-core/images/core-image-minimal.bb

CORE_OS = "\
    openssh openssh-keygen openssh-sftp-server \
    tzdata \
"

DEV_SDK = "\
    libstdc++ \
"

AWS_TOOLS = "\
    aws-iot-device-sdk-python-v2 \
"

IMAGE_INSTALL += " \
    ${CORE_OS} \
    ${DEV_SDK} \
    ${AWS_TOOLS} \
"