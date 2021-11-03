FROM golang as builder
ARG BUILDID
COPY main.go .
RUN go build -ldflags "-linkmode external -extldflags -static -X main.BuildID=${BUILDID}" -a main.go

FROM scratch
COPY --from=builder /go/main /main
CMD ["/main"]