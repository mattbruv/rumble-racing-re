package chunk

type Ctrl struct {
	index        uint32
	fourCC       string
	startAddress uint32
	data         []byte
}

func (c *Ctrl) FourCC() string {
	return c.fourCC
}

func (c *Ctrl) TotalSize() uint32 {
	return uint32(len(c.data))
}

func (c *Ctrl) StartAddress() uint32 {
	return c.startAddress
}

func (c *Ctrl) Data() []byte {
	return c.data
}

// 3. Implement TopLevelChunk interface method
func (c *Ctrl) Index() uint32 {
	return c.index
}
