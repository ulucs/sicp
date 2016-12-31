;the difference is that we truncate the impossible
;branches before moving on with the next step
;of recursion, while Louis's change makes the algorithm
;compute all the possible trees at first and then
;remove the invalid ones.

;putting 8 queens into 8 different positions can be done
;in 8^8 = 2^24 possible ways
;while our algorithm truncates in the following way:
;step 1: 8 possible
;step 2: 8 possible (8*8), three truncated
;step 3: 8 possible (8*8*5), about half truncated
;...
;step 8: 8 possible (8*4^7)
;so our algorithm seems to work in somewhat a squareroot
;of time

;therefore i predict T^2
