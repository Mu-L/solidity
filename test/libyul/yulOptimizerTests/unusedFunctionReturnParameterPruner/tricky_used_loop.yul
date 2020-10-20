// A test to see if loop condition is properly split
{
    let b := f()
    // Return value of f is used in for loop condition. So f cannot be rewritten.
    for {let a := 1} iszero(sub(f(), a)) {a := add(a, 1)}
    {}
    function f() -> x
    {
        x := sload(1)
        sstore(x, x)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     pop(f())
//     let a := 1
//     for { }
//     true
//     {
//         let a_7 := a
//         a := add(a_7, 1)
//     }
//     {
//         if iszero(iszero(sub(f(), a))) { break }
//     }
//     function f() -> x
//     {
//         x := sload(1)
//         let x_5 := x
//         sstore(x_5, x_5)
//     }
// }
