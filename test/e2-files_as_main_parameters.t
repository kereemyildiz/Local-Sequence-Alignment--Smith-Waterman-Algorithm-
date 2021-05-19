- init:
    run: rm -f q.o q
    blocker: true

- build:
    run: g++ -std=c++11 -Wall -Werror  smith-waterman.cpp -o e2_out                  # timeout: 8
    blocker: true

- case1a:
    run: ./e2_out strings_e2-1.txt output_e2-1.txt
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case1b:
    run: cmp output_e2-1.txt output_e2-1_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case2a:
    run: ./e2_out strings_e2-2.txt output_e2-2.txt
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case2b:
    run: cmp output_e2-2.txt output_e2-2_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case3a:
    run: ./e2_out strings_e2-3.txt output_e2-3.txt
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case3b:
    run: cmp output_e2-3.txt output_e2-3_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0
