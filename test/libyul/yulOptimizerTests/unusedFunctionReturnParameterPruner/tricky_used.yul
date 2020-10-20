// A test to see if expression are properly split
{
    let a := f()
    // Return value of f is used here. So f cannot be rewritten.
    sstore(sload(f()), 2)
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
//     let _1 := 2
//     sstore(sload(f()), _1)
//     function f() -> x
//     {
//         x := sload(1)
//         let x_5 := x
//         sstore(x_5, x_5)
//     }
// }
