namespace RMECore
open IntelliFactory.WebSharper

[<JavaScript>]
module Debug =

    let log(message) = JavaScript.Log(message)
    let alert(message) = JavaScript.Alert(message)

