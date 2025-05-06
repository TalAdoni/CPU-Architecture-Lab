LAB 2

In the following files we implemented a synchronous modulo counter system using two counting mechanisms: fast counter and slow counter.

The system behavior:

- The counter increases from 0 up to a configurable upperBound_i.
- If the repeat_i input is '1', the counter resets to 0 and restarts after reaching the upper bound.
- If repeat_i is '0', the counter holds the maximum reached value.
- A reset input rst_i resets both counters to 0 at any point.

The hardware implementation is based on two subsystems:
- Fast counter – always active, acts as the time reference.
- Slow counter – updated based on the fast counter and produces the actual output.

INPUTS:

- clk_i – Clock signal.
- rst_i – Reset signal (asynchronous).
- repeat_i – Enables repeated counting behavior.
- upperBound_i – Sets the upper limit of the counter.

OUTPUTS:

- count_o – The current counter value (from fast counter).
- busy_o – Status indicator; low when counting has finished and repeat_i is 0.

#The lab created by Omri Aviram and Tal Adoni.#
