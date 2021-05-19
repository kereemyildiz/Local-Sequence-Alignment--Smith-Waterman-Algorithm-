- init:
    run: rm -f q.o q
    blocker: true

- build:
    run: g++ -std=c++11 -Wall -Werror  smith-waterman.cpp -o e3_out                  # timeout: 8
    blocker: true

- case1a:
    run: ./e3_out strings_e3-1.txt output_e3-1.txt 1 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case1b:
    run: cmp output_e3-1.txt output_e3-1_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case2a:
    run: ./e3_out strings_e3-1.txt output_e3-2.txt 2 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case2b:
    run: cmp output_e3-2.txt output_e3-2_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case3a:
    run: ./e3_out strings_e3-1.txt output_e3-3.txt 1 -3 -6
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case3b:
    run: cmp output_e3-3.txt output_e3-3_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case4a:
    run: ./e3_out strings_e3-2.txt output_e3-4.txt 1 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case4b:
    run: cmp output_e3-4.txt output_e3-4_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case5a:
    run: ./e3_out strings_e3-2.txt output_e3-5.txt 2 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case5b:
    run: cmp output_e3-5.txt output_e3-5_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case6a:
    run: ./e3_out strings_e3-2.txt output_e3-6.txt 1 -3 -6
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case6b:
    run: cmp output_e3-6.txt output_e3-6_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case7a:
    run: ./e3_out strings_e3-3.txt output_e3-7.txt 1 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case7b:
    run: cmp output_e3-7.txt output_e3-7_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case8a:
    run: ./e3_out strings_e3-3.txt output_e3-8.txt 2 -2 -4
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case8b:
    run: cmp output_e3-8.txt output_e3-8_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0

- case9a:
    run: ./e3_out strings_e3-3.txt output_e3-9.txt 1 -3 -6
    points: 0
    script:
        - expect: _EOF_                                         # timeout: 8

    return: 0

- case9b:
    run: cmp output_e3-9.txt output_e3-9_sln.txt
    points: 20
    script:
        - expect: _EOF_                                         # timeout: 8
        
    return: 0
