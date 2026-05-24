module rumble-reader-cli

go 1.25.1

require rumble-reader v0.0.0

replace rumble-reader => ./core

require (
	github.com/qmuntal/gltf v0.28.0
	github.com/spf13/cobra v1.10.1
)

require (
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
)
