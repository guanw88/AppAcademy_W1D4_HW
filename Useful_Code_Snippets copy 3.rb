
# Stack Trace for Stack Overflow Errors
#
# Get a stack trace. Ruby won't normally print a stack trace for stack overflow
# errors, because this might print several thousand lines to the screen. If you're
# having a hard time debugging a stack overflow, you can paste the following code
# snippet at the top of your file. The snippet will intentionally crash your
# program before the stack overflow occurs, allowing you to read the stack trace.

MAX_STACK_SIZE = 200
tracer = proc do |event|
  if event == 'call' && caller_locations.length > MAX_STACK_SIZE
    fail "Probable Stack Overflow"
  end
end
set_trace_func(tracer)
