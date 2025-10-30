package chunk

type Fill struct {
	index        uint32
	fourCC       string
	startAddress uint32
	data         []byte
}

func (c *Fill) FourCC() string {
	return c.fourCC
}

func (c *Fill) TotalSize() uint32 {
	return uint32(len(c.data))
}

func (c *Fill) StartAddress() uint32 {
	return c.startAddress
}

func (c *Fill) Data() []byte {
	return c.data
}

// 3. Implement TopLevelChunk interface method
func (c *Fill) Index() uint32 {
	return c.index
}
