###### All_uniq?
---------
# Implement an algorithm to determine if a string has all unique characters.

* Return false if string.size > alphabet.size (check if ASCII encodings?)
* Create a hash map out of each character
* Walk down the array, check if any char appears more than once
* O(n) time, O(n) space

* If restricted to ASCII encodings, then the hash map is going to be of a fixed size
* Can also use a bit-array of all valid ASCII codes for faster checking
* Reduces to O(1) space

# What if you cannot use additional data structures?
* Quick-sort the characters in place (or heap-sort for O(1) space)
* Scan left-to-right, check if any characters side-by-side are identical
* O(nlgn) time, O(lgn)/O(1) space

###### Reverse a string
---------
# Assume it's null-terminated.

* Have two pointers, starting at the beginning and end of the string (before null-terminator)
* Have them walk backwards and keep swapping until the end_pointer >= beginning_pointer

###### Anagrams? or Permutations?
---------
# Given two strings.

* First compare lengths.
* Then build a counts hash map of characters in the first string.
* Iterate over second string, and decrement counts until you get a negative value.
* Then return false. Else true.
* O(n) time, O(A) space where A is alphabet size.
* Can keep a counts array in O(1) space if you assume a limited ASCII alphabet (256 bytes total; 1 byte per character).

* Can do in O(1) space by heap-sorting the strings, then comparing them.
* Takes O(nlgn) time.

###### Replace spaces
---------
# Write a method to replace all spaces in a string with "%20".
# You may assume the string has sufficient space to hold the additional characters.

* Iterate over the characters.
* Two choices: if you hold a buffer of everything after the first space,
  * (potentially O(n) space), then you can push each character into
  * a new string, replacing each space with "%20".
* Otherwise, if you want to do it completely in-place, you can do one replace and
  * two insertions per space. Thus takes 2n insertions, for O(n) time per insertion.
  * Basically, O(n * m) where m is the number of insertions.

###### String Compression
---------
# Write a method that performs basic string compression using the counts of repeated
# characters. I.e., aaabccdeeeeff should become a3b1c2d1e4f2. If the compressed string
# would not be shorter than the original string, return the original string.

* Scan through the array and character by character, count the runs of that character.
* Put them into an array of chars. If the array of chars is longer than the original string,
  just return the original string.
* Use array#join to join the characters into a string without repeated concatenation.

###### Rotate an NxN matrix
--------
# Write a method that rotates a matrix, ideally in-place.

* One method is for each i, j in the original matrix, transpose it into
* [j, i] in a new matrix that's a copy.

* Takes O(N^2) time and O(N^2) space to allocate the new matrix.

* Can do this in place by rotating in by concentric squares in the matrix.
* Can copy one line at a time and place it on the counter-clockwise side for O(n) space.
* But really, can copy one element at a time for O(1) space. (Just do 4 copies per iteration
* at each index of each level.)

###### Set 0s
--------
# Write an algorithm such that if an element in a matrix is 0, its column
# and row are set to 0s.

* First thing you could do is scan for any 0s. If you see one, then iterate
* through its column and row and set it to 0s. However, if you see another one
* as you're iterating, put it into a row column or column-column and set them
* all to 0s. Worst-case, you end up taking quadratic space in an array of all 0s.

* Even better is to use an external boolean array for each column. Just set them like that.
* This takes O(n + m) space, where n x m is the length of the matrix.

* Can do better by just using the top and left sides of the matrix as bit arrays
* to store whether those columns should be set to all 0s (no need to change them),
* except to store in two booleans whether that first_column and first_row should be
* wiped with 0s at the end of the algorithm. You then iterate through each element
* and set the corresponding column and row bit to 0 if its a 0.

* Finally, go through all of the columns and rows and set them to 0 if the top or left
* sides are 0s. And lastly, if either the left column or top row have their booleans
* set, wipe them as well.

* Takes O(1) space.


###### is_rotation?
--------
* Check whether the string is found inside your original string + your original string.

O(n) space, O(n) time.
