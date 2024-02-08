package ankh

import (
	"testing"
)

func TestConcurrentUi_implement(t *testing.T) {
	var _ Ui = new(ConcurrentUi)
}
