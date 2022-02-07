IMAGE_NAME=test


if [ "${IMAGE_NAME}" = "" ]; then
exit 1
fi

docker run --rm -it \
    -v "C:\Users\xxxxxxx\xxxxxx":/home \
    ${IMAGE_NAME}
