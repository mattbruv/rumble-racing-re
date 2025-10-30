package chunk

type Shoc struct {
	index        uint32
	fourCC       string
	startAddress uint32
	data         []byte
}

func (c *Shoc) FourCC() string {
	return c.fourCC
}

func (c *Shoc) TotalSize() uint32 {
	return uint32(len(c.data))
}

func (c *Shoc) StartAddress() uint32 {
	return c.startAddress
}

func (c *Shoc) Data() []byte {
	return c.data
}

// 3. Implement TopLevelChunk interface method
func (c *Shoc) Index() uint32 {
	return c.index
}
