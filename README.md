###Fast Special Matrix
========

This code works supports fast application of circulant matrix, Hankel matrix, Hankel circulant matrix,
Toeplitz matrix and Toeplitz symmetric matrix. The complexity of all these application is O(N log N)
where N is the size of matrices.

The following instructions works in Matlab.

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
