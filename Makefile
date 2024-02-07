TEST?=./... 

default: test 

# test runs the test suite and vets the code 
test: 
	go list $(TEST) | xargs -n1 go test -timeout=60s -parallel=10 $(TESTARGS)

# test trace runs the race checker
testrace: 
	go list $(TEST) | xargs -n1 go test -race $(TESTARGS)

#updatedeps installs required dependencies to run and build 
updatedeps: 
	go mod download 

.PHONY: test testrace updatedeps 