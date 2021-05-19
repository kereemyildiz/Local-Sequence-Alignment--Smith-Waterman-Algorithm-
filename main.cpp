#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;

class ScoreParam {
private:
    int gap;
    int match;
    int mismatch;
public:
    ScoreParam(int match,int mismatch,int gap);
    int getGap() const { return gap; }
    int getMatch() const { return match; }
    int getMismatch() const { return mismatch; }
};
ScoreParam::ScoreParam(int match, int mismatch, int gap){
    this->gap = gap;
    this->match = match;
    this->mismatch = mismatch;
}
class OptResultIndexes {
private:
    int score;
    int i;
    int j;
public:
    int getI() const { return i;}
    int getJ() const { return j;}
    int getScore() const { return score;}
    void setI(int _i) { i = _i;}
    void setJ(int _j) { j = _j;}
    void setScore(int _score) {score = _score; }
};


int main()
{
    vector<string> s;
    ifstream file("test/strings_e2-1.txt");
    if (file.is_open())
    {
        string word;
        while (getline(file,word))
        {
            s.push_back(word);
//            cout << word <<endl;
        }
    }
    else {
        cout << "FILE cannot opened" << endl;
    }
    ScoreParam score = ScoreParam(1,-2,-4);

    sort(s.begin(),s.end());
    for (unsigned int i = 0; i < s.size(); i++)
    {
        for (unsigned int j = i+1; j < s.size(); j++ )
        {
            int best = 0;
            vector<OptResultIndexes> results;
            string seq2 = s[i];
            string seq3 = s[j];
            unsigned int size2 = seq2.length();
            unsigned int size3 = seq3.length();

//    for (auto & i : s)
//    {
//        cout << i << endl;
//    }

            // kombinasyon yapılacak
            // şimdilik seq2 ve seq3 u alıyoruz
            // vectorde tutup karsılastırma yapılabilir

            int main_matrix[size2+1][size3+1];
            std::fill(main_matrix[0],main_matrix[0] + (size2+1)*(size3+1), 0); // matrix is filled with zeros
            int match_checker_matrix[size2][size3];
            std::fill(match_checker_matrix[0],match_checker_matrix[0] + (size2)*(size3), 0); // matrix is filled with zeros

            // Fill match checker matrix according to given sequences

            for (unsigned int i = 0; i < size2 ; i++)
            {
                for (unsigned int j = 0; j < size3; j++)
                {
                    if (seq2[i] == seq3[j])
                    {
                        match_checker_matrix[i][j] = score.getMatch();
                    }
                    else
                    {
                        match_checker_matrix[i][j] = score.getMismatch();
                    }
                }
            }

            for (unsigned int i = 1 ; i < size2 + 1; i++)
            {
                for (unsigned int j = 1; j < size3 + 1; j++)
                {
                    main_matrix[i][j] = max({(main_matrix[i-1][j-1] + match_checker_matrix[i-1][j-1]),
                                            main_matrix[i-1][j] + score.getGap(),
                                            main_matrix[i][j-1] + score.getGap(),0});

                    if (main_matrix[i][j] >= best) {
                        if (main_matrix[i][j] > best) // we need to clear result vector if we find better optimum score.
                            results.clear();
                        best = main_matrix[i][j];
                        OptResultIndexes newResult = {};
                        newResult.setI(i);
                        newResult.setJ(j);
                        newResult.setScore(best);
                        results.push_back(newResult);
                    }
                }
            }

//    cout << "MATRIX !!! :\n";
//    for (int i = 0; i < size2+1; i++)
//    {
//        for (int j = 0; j < size3+1; j++)
//        {
//            cout << main_matrix[i][j] << " ";
//        }
//        cout << endl;
//    }

            // lets print indexes and score
            vector<string> strings;
            for (auto & result : results)
            {
//              cout << "Score: "<< result.getScore() <<", i:" << result.getI() << ", j:" << result.getJ() << endl;
                int _i = result.getI();
                int _j = result.getJ();
                string aligned="";
                while (main_matrix[_i][_j] != 0)
                {
                    if (_i > 0 && _j > 0 && main_matrix[_i][_j] == main_matrix[_i-1][_j-1] + match_checker_matrix[_i-1][_j-1])
                    {
                        aligned += seq2[_i-1];
                        _i--;
                        _j--;
                    }
                    else if (_i > 0 && main_matrix[_i][_j] == main_matrix[_i-1][_j] + score.getGap())
                    {
                        aligned += seq2[_i-1];
                        _i--;
                    }
                    else {
                        aligned += seq2[_i-1];
                        _j--;
                    }
                }
                if (aligned != "" && !count(strings.begin(),strings.end(), aligned))
                {
                    reverse(aligned.begin(),aligned.end());
                    strings.push_back(aligned);
                }
            }
            sort(strings.begin(),strings.end());
            ofstream myfile;
            myfile.open("output.txt",std::ios_base::app);
            myfile <<seq2<< " - "<< seq3 << endl;
            myfile << "Score: "<< best << " Sequence(s):";
            for (auto & string : strings)
            {
                myfile << " ";
                myfile <<"\""<< string << "\"";
            }
            myfile << endl;

            // We created matrix, now we need to traceback

        }
    }
    return 0;
}