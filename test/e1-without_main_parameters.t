- init:
    run: rm -f q.o q
    blocker: true

- build:
    run: g++ -std=c++11 -Wall -Werror  smith-waterman.cpp -o e1_out                  # timeout: 8
    blocker: true

- case1a:
    run: ./e1_out
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case1b:
    run: cmp output.txt output_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0
