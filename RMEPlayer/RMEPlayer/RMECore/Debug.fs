namespace RMECore
module Debug =
    open IntelliFactory.WebSharper

    // Log process
    let log s = JavaScript.Log(s)
    let alert s = JavaScript.Alert(s)