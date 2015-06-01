###Fast Special Matrix
========

This code supports the fast applications of circulant matrices, Hankel matrices, Hankel circulant matrices,
Toeplitz matrices and Toeplitz symmetric matrices. The complexities of all these applications are O(N log N)
where N is the size of matrices.

The following instructions work in Matlab.

### Install
---------

1. Download Fast Special Matrix
  ```
  git clone https://github.com/YingzhouLi/FastSpecialMat.git
  cd FastSpecialMat
  ```

2. Install Fast Special Matrix
  ```
  matlab -nojvm -r "install;quit"
  ```

4. Test Fast Special Matrix
  ```
  cd test
  matlab &
  >> test
  >> test_scaling
  ```

### Uninstall
---------

1. Download Fast Special Matrix

  ```
  git clone https://github.com/YingzhouLi/FastSpecialMat.git
  cd FastSpecialMat
  ```  

2. Uninstall Fast Special Matrix

  ```
  matlab -nojvm -r "install(-1);quit"
  ```
