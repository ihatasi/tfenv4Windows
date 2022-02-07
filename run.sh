IMAGE_NAME=test


if [ "${IMAGE_NAME}" = "" ]; then
exit 1
fi

docker run --rm -it \
    -v "C:\Users\enter\Desktop\Terraform":/home \
    ${IMAGE_NAME}
