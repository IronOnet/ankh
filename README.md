# ankh
A Library for implementing command line interfaces in Go


## Features 

* Eeasy subcommands based CLIs: `app-cli foo`, `app-cli bar`. 

* Support for nested subcommands such as `app-cli foo bar`

* Optional support for default subcommands so `app-cli` does something other than error 

* Support for shell autocompletion of commands, flags and arguments with callbacks in Go. You don't need to write any shell code. 

* Automatic help generation for listing subcommands. 

* Automatic help flag recognition of `-h`, `--help` etc. 

* Automatic version flag recognition `-`, `--version`

* Helpers for interacting with the terminal, such as outputing information, 
    aksing for input etc. These are optional, you can always interact with the terminal 
    however you choose.

* Use of Go interfaces/types makes augmenting various parts of the library a piece 
    of cake.

## Example 

Below is a simple example of running a CLI 

```go

package main 

import (
    "log" 
    "os" 

    "github.com/irononet/ankh"


    func main(){
        cli := ankh.NewCLI("app", "0.1.0") 
        cli.Args = os.Args[1:]
        cli.Commands = map[string]ankh.CommandFactory{
            "foo": fooCommand, 
            "bar": barCommand,
        }

        exitStatus, err := cli.Run()
        if err != nil{
            log.Println(err) 
        }

        os.Exit(exitStatus)
    }
)

```
