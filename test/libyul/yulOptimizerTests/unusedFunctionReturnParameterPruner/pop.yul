// A test to see if the optimization step can deal with pop
// Expression splitter converts `pop(f(a))` into
// {
//   let z := f(a)
//   pop(z)
// }
// Unless `pop(z)` is removed, `f` cannot be rewritten.
{
    let a := sload(1)
    pop(f(a))
    function f(x) -> y
    {
      sstore(x, x)
      y := sload(x)
    }
}
// ----
// step: unusedFunctionReturnParameterPruner
//
// {
//     pop(f(sload(1)))
//     function f(x) -> y
//     {
//         sstore(x, x)
//         y := sload(x)
//     }
// }
