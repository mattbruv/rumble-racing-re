package cmd

import (
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"runtime/debug"
	"sync"
	"time"
)

const extractLogName = "extract-log.txt"

type extractLog struct {
	mu       sync.Mutex
	file     *os.File
	path     string
	problems int
}

func newExtractLog(outputDir string) (*extractLog, error) {
	logPath := filepath.Join(outputDir, extractLogName)

	logFile, err := os.Create(logPath)
	if err != nil {
		return nil, fmt.Errorf("failed to create log file %s: %w", logPath, err)
	}

	extractLog := &extractLog{
		file: logFile,
		path: logPath,
	}

	extractLog.write("Extraction started " + time.Now().Format(time.RFC1123))

	log.SetOutput(io.MultiWriter(os.Stderr, logFile))

	return extractLog, nil
}

func (l *extractLog) note(sourceFile string, format string, args ...any) {
	message := fmt.Sprintf(format, args...)

	fmt.Println(sourceFile+":", message)
	l.write(sourceFile + ": " + message)

	l.mu.Lock()
	l.problems++
	l.mu.Unlock()
}

func (l *extractLog) recoverPanic(sourceFile string) {
	problem := recover()
	if problem == nil {
		return
	}

	l.note(sourceFile, "panic while extracting: %v (stack trace in %s)", problem, extractLogName)
	l.write(string(debug.Stack()))
}

func (l *extractLog) write(line string) {
	l.mu.Lock()
	defer l.mu.Unlock()

	fmt.Fprintf(l.file, "[%s] %s\n", time.Now().Format(time.TimeOnly), line)
}

func (l *extractLog) summarize() string {
	l.mu.Lock()
	problems := l.problems
	l.mu.Unlock()

	if problems == 0 {
		return "No problems reported."
	}

	return fmt.Sprintf("%d problem(s) reported, see %s", problems, l.path)
}

func (l *extractLog) close() {
	l.write(l.summarize())

	log.SetOutput(os.Stderr)
	l.file.Close()
}
