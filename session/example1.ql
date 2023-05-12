// Step 1
// void test_const(void)
// void test_const_var(void)
from AllocationExpr buffer, ArrayExpr access, int bufferSize, int accessIdx, Expr allocSizeExpr
where
  // malloc (100)
  // ^^^^^^  AllocationExpr buffer
  //
  // buf[...]
  // ^^^  ArrayExpr access
  //
  // buf[...]
  //     ^^^  int accessIdx
  //
  accessIdx = access.getArrayOffset().getValue().toInt() and
  //
  // malloc (100)
  //         ^^^ allocSizeExpr / bufferSize
  //
  allocSizeExpr = buffer.(Call).getArgument(0) and
  bufferSize = allocSizeExpr.getValue().toInt()
select buffer, access, accessIdx, access.getArrayOffset(), bufferSize, allocSizeExpr